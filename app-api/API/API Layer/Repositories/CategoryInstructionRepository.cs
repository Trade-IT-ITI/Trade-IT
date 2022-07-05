using API_Layer.Helper;
using API_Layer.QueryParameters;
using API_Layer.Repositories.Interfaces;
using DatabaseLayer.Data;
using DatabaseLayer.Models;
using Microsoft.EntityFrameworkCore;

namespace API_Layer.Repositories
{
    public class CategoryInstructionRepository : ICategoryInstructionRepository
    {
        private readonly AppDbContext _context;

        public CategoryInstructionRepository(AppDbContext context)
        {
            _context = context;
        }
        public async Task<List<CategoryInstruction>> GetAll(QueryParameter queryParameters)
        {
            IQueryable<CategoryInstruction> CategoryInstructions = _context.CategoriesInstructions;

            if (queryParameters != null)
            {
                //expanding related data
                if (queryParameters.expand != null && queryParameters.expand.Length != 0)
                {
                    CategoryInstructions = CategoryInstructions.Expand(queryParameters.expand);
                }
            }
            return await CategoryInstructions.ToListAsync();
        }
        public async Task Add(CategoryInstruction categoryInstruction)
        {
            await _context.AddAsync(categoryInstruction);
            await _context.SaveChangesAsync();
        }
    }
}
