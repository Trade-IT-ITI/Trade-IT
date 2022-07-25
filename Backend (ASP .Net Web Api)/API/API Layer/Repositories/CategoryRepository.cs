using DatabaseLayer.Models;
using DatabaseLayer.Data;
using Microsoft.EntityFrameworkCore;
using API_Layer.Repositories.Interfaces;
using API_Layer.QueryParameters;
using API_Layer.Helper;

namespace API_Layer.Repositories
{
    public class CategoryRepository : ICategoryRepository
    {
        private readonly AppDbContext _context;

        public CategoryRepository(AppDbContext context)
        {
            _context = context;
        }
        public async Task<List<Category>> GetAll(QueryParameter queryParameters)
        {
            IQueryable<Category> Categories = _context.Categories;

            if (queryParameters != null)
            {
                //expanding related data
                if (queryParameters.expand != null && queryParameters.expand.Length != 0)
                {
                    Categories = Categories.Expand(queryParameters.expand);
                }
            }
            return await Categories.ToListAsync();
        }
        public async Task Add(Category category)
        {
            await _context.AddAsync(category);
            await _context.SaveChangesAsync();
        }
    }
}


