using API_Layer.Helper;
using API_Layer.QueryParameters;
using API_Layer.Repositories.Interfaces;
using DatabaseLayer.Data;
using DatabaseLayer.Models;
using Microsoft.EntityFrameworkCore;

namespace API_Layer.Repositories
{
    public class AreaRepository : IAreaRepository
    {
        private readonly AppDbContext _context;

        public AreaRepository(AppDbContext context)
        {
            _context = context;
        }
        public async Task<List<Area>> GetAll(QueryParameter queryParameters)
        {
            IQueryable<Area> Areas = _context.Areas;

            if (queryParameters != null)
            {
                //expanding related data
                if (queryParameters.expand != null && queryParameters.expand.Length != 0)
                {
                    Areas = Areas.Expand(queryParameters.expand);
                }
            }
            return await Areas.ToListAsync();
        }
        public async Task Add(Area area)
        {
            await _context.AddAsync(area);
            await _context.SaveChangesAsync();
        }
    }
}

