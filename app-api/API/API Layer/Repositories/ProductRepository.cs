using DatabaseLayer.Models;
using DatabaseLayer.Data;
using Microsoft.EntityFrameworkCore;
using API_Layer.Repositories.Interfaces;
using API_Layer.QueryParameters;
using API_Layer.Helper;
using API_Layer.DataModels;

namespace API_Layer.Repositories
{
    public class ProductRepository : IProductRepository
    {
        private readonly AppDbContext _context;
        private readonly IWebHostEnvironment hostEnvironment;

        public ProductRepository(AppDbContext context , IWebHostEnvironment hostEnvironment)
        {
            _context = context;
            this.hostEnvironment = hostEnvironment;
        }

        public async Task Add(Product product , IFormFile image)
        {
            if (image.Length > 0)
            {

                await _context.Products.AddAsync(product);
                await _context.SaveChangesAsync();

                var folderName = Path.Combine(hostEnvironment.WebRootPath , $@"Images\{product.ProductId}");
                Directory.CreateDirectory(folderName);
                //create folder for product images and it's name equals product id

                var fileName = $"{product.ProductId}-{Guid.NewGuid()}-{image.FileName}";

                var fullPath = Path.Combine(folderName , fileName);
                using (var stream = new FileStream(fullPath , FileMode.Create))
                {
                    await image.CopyToAsync(stream);
                }
                ProductImage productImage = new ProductImage()
                {
                    Name = fileName ,
                    ProductId = product.ProductId
                };

                await _context.AddAsync(productImage);
                await _context.SaveChangesAsync();
            }
            else
            {
                throw new Exception("Image Required");
            }
        }

        public async Task<ProductsData> GetAll(ProductQueryParameter queryParameters)
        {
            ProductsData productsData = new ProductsData();
            IQueryable<Product> Products = _context.Products;

            if (queryParameters != null)
            {
                //searching
                if (!string.IsNullOrEmpty(queryParameters.searchText))
                {
                    Products = Products.Where(p => p.Title.Contains(queryParameters.searchText));
                }

                //filteration
                if (queryParameters.minPrice != null)
                    Products = Products.Where(p => p.Price >= queryParameters.minPrice.Value);

                if (queryParameters.maxPrice != null)
                    Products = Products.Where(p => p.Price <= queryParameters.maxPrice.Value);

                if (queryParameters.city != null)
                    Products = Products.Where(p => p.CityId == queryParameters.city.Value);

                if (queryParameters.area != null)
                    Products = Products.Where(p => p.AreaId == queryParameters.area.Value);

                if (queryParameters.category != null)
                    Products = Products.Where(p => p.Subcategory.CategoryId == queryParameters.category.Value);

                if (queryParameters.subcategory != null)
                    Products = Products.Where(p => p.SubcategoryId == queryParameters.subcategory.Value);

                if (queryParameters.status != null)
                    Products = Products.Where(p => p.StatusId == queryParameters.status.Value);

                productsData.ProductsCount = Products.Count();

                //sorting
                if (!string.IsNullOrWhiteSpace(queryParameters.orderBy))
                {
                    Products = Products.Sort(queryParameters.orderBy , queryParameters.asc ?? true);
                }

                //paginagtion
                if (queryParameters.pageNumber != null && queryParameters.pageCapacity != null)
                {
                    int skipValue = ((queryParameters.pageNumber - 1) * queryParameters.pageCapacity).Value;
                    Products = Products.Skip(skipValue).Take(queryParameters.pageCapacity.Value);
                }

                //expanding related data
                if (queryParameters.expand != null && queryParameters.expand.Length != 0)
                {
                    Products = Products.Expand(queryParameters.expand);
                }

                productsData.Products = await Products.AsNoTracking().ToListAsync();
            }
            return productsData;
        }

        public async Task<ProductData> GetById(int id)
        {
            var product = await _context.Products.AsNoTracking().Select(p => new ProductData()
            {
                ProductId = p.ProductId ,
                Title = p.Title ,
                Descrioption = p.Descrioption ,
                City = p.City.Name ,
                Area = p.Area.Name ,
                Status = p.Status.Name ,
                Category = p.Subcategory.Category.Name ,
                Subcategory = p.Subcategory.Name ,
                PostDateTime = p.PostDateTime ,
                Price = p.Price ,
                ViewsCount = p.ViewsCount ,
                RequestCount = p.RequestCount ,
                ProductImages = p.ProductImages.Select(pi => pi.Name).ToList() ,
                Owner = p.Owner ,
                Instructions = p.Subcategory.Category.CategoryInstructions
                .Select(ci => _context.Instructions
                .AsNoTracking()
                .SingleOrDefault(catIns => catIns.InstructionId == ci.InstructionId).Text)
                .ToList()
            }).SingleOrDefaultAsync(p => p.ProductId == id);
            return product;
        }
    }
}