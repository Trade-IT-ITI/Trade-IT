using API_Layer.QueryParameters;
using API_Layer.Repositories.Interfaces;
using DatabaseLayer.Data;
using DatabaseLayer.Models;

namespace API_Layer.Repositories
{
    public class SubcategoryRepository:ISubcategoryRepository
    {
        private readonly AppDbContext context;

        public SubcategoryRepository(AppDbContext context)
        {
            this.context = context;
        }

        public async Task Add(Subcategory subcategory)
        {
            await context.AddAsync(subcategory);
            await context.SaveChangesAsync();
        }

        public Task<List<Subcategory>> GetAll()
        {
            throw new NotImplementedException();
        }
    }
}
