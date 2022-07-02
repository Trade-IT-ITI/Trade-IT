using DatabaseLayer.Models;
using DatabaseLayer.Data;
using Microsoft.EntityFrameworkCore;
using API_Layer.Repositories.Interfaces;
using API_Layer.QueryParameters;
using API_Layer.Helper;
using System.Linq.Expressions;
using System.ComponentModel;
using System.Reflection;

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
            IQueryable<Product> Products = _context.Products;

            if (queryParameters != null)
            {
                //search
                if (!string.IsNullOrEmpty(queryParameters.searchText))
                {
                    IQueryable<Product> result;
                    result = Products.Where(p => p.Title.Contains(queryParameters.searchText))
                        .Concat(Products.Where(p => p.Descrioption.Contains(queryParameters.searchText)));

                    Products = result.Distinct();
                }

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