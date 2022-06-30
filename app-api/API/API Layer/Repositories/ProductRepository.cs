﻿using DatabaseLayer.Models;
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
            IQueryable<Product> Products;
            if (queryParameters != null)
            {
                Products = _context.Products;

                //paginagtion
                if (queryParameters.pageNumber != null && queryParameters.pageCapacity != null)
                {
                    int skipValue = ((queryParameters.pageNumber - 1) * queryParameters.pageCapacity).Value;
                    Products = Products.Skip(skipValue).Take(queryParameters.pageCapacity.Value);
                }

                //sorting
                if (!string.IsNullOrWhiteSpace(queryParameters.orderBy))
                {
                    Products = Products.Sort(queryParameters.orderBy , queryParameters.orderType ?? SortType.asc.ToString());
                }

                //expanding
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