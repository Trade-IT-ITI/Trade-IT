using DatabaseLayer.Models;
using DatabaseLayer.Data;
using Microsoft.EntityFrameworkCore;
using API_Layer.Repositories.Interfaces;

namespace API_Layer.Repositories
{
    public class CategoryRepository : IRepository<Category>, ICategoryRepository
    {
        private readonly AppDbContext context;

        public CategoryRepository(AppDbContext context)
        {
            this.context = context;
        }
        public async Task<List<Category>> GetAll( )
        {
             IQueryable<Category> categories = context.Categories.Include(c => c.Subcategories);
            return await categories.ToListAsync();
        }
        public async Task Add(Category category)
        {
            await context.AddAsync(category);
            await context.SaveChangesAsync();
           
        }
    }
}


