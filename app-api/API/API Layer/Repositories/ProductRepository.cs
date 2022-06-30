using DatabaseLayer.Models;
using DatabaseLayer.Data;
using Microsoft.EntityFrameworkCore;
using API_Layer.Repositories.Interfaces;
using API_Layer.QueryParameters;
using API_Layer.Helper;

namespace API_Layer.Repositories
{
    public class ProductRepository : IRepository<Product>
    {
        private readonly AppDbContext _context;

        public ProductRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task<List<Product>> GetAll(QueryParameter queryParameters)
        {
            IQueryable<Product> Products;
            if (queryParameters != null)
            {
                Products = _context.Products;

                if (!string.IsNullOrWhiteSpace(queryParameters.orderBy))
                {
                    Products = Products.Sort(queryParameters.orderBy , queryParameters.orderType ?? SortType.asc.ToString());
                }

                if (queryParameters.expand != null && queryParameters.expand.Length != 0)
                {
                    Products.Expand(queryParameters.expand);
                }
            }
            else
                Products = _context.Products;

            return await Products.ToListAsync();
        }
    }
}