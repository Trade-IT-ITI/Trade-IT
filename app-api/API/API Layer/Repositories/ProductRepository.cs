using DatabaseLayer.Models;
using DatabaseLayer.Data;
using Microsoft.EntityFrameworkCore;
using API_Layer.Repositories.Interfaces;
using API_Layer.QueryParameters;
using API_Layer.Helper;


namespace API_Layer.Repositories
{
    public class ProductRepository : IProductRepository
    {
        private readonly AppDbContext _context;

        public ProductRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task<List<Product>> GetAll(ProductQueryParameter queryParameters)
        {
            IQueryable<Product> Products = _context.Products;

            if (queryParameters != null)
            {
                //searching
                if (!string.IsNullOrEmpty(queryParameters.searchText))
                {
                    IQueryable<Product> result;
                    result = Products.Where(p => p.Title.Contains(queryParameters.searchText))
                        .Concat(Products.Where(p => p.Descrioption.Contains(queryParameters.searchText)));

                    Products = result.Distinct();
                }

                //filteration
                if (queryParameters.minPrice != null)
                    Products = Products.Where(p => p.Price >= queryParameters.minPrice.Value);

                if (queryParameters.maxPrice != null)
                    Products = Products.Where(p => p.CityId <= queryParameters.maxPrice.Value);

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
            }
            return await Products.ToListAsync();
        }
    }
}