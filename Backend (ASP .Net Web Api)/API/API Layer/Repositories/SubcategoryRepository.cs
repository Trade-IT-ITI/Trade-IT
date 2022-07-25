using DatabaseLayer.Models;
using DatabaseLayer.Data;
using Microsoft.EntityFrameworkCore;
using API_Layer.Repositories.Interfaces;
using API_Layer.QueryParameters;
using API_Layer.Helper;

namespace API_Layer.Repositories
{
    public class SubcategoryRepository : ISubcategoryRepository
    {
        private readonly AppDbContext _context;

        public SubcategoryRepository(AppDbContext context)
        {
            _context = context;
        }
        public async Task<List<Subcategory>> GetAll(QueryParameter queryParameters)
        {
            IQueryable<Subcategory> Subcategories = _context.Subcategories;

            if (queryParameters != null)
            {
                //expanding related data
                if (queryParameters.expand != null && queryParameters.expand.Length != 0)
                {
                    Subcategories = Subcategories.Expand(queryParameters.expand);
                }
            }
            return await Subcategories.ToListAsync();
        }

        public async Task Add(Subcategory subcategory)
        {
            await _context.AddAsync(subcategory);
            await _context.SaveChangesAsync();
        }
    }
}
