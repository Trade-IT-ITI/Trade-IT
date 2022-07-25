using API_Layer.Helper;
using API_Layer.QueryParameters;
using API_Layer.Repositories.Interfaces;
using DatabaseLayer.Data;
using DatabaseLayer.Models;
using Microsoft.EntityFrameworkCore;

namespace API_Layer.Repositories
{
    public class CityRepository : ICityRepository
    {
        private readonly AppDbContext _context;

        public CityRepository(AppDbContext context)
        {
            _context = context;
        }
        public async Task<List<City>> GetAll(QueryParameter queryParameters)
        {
            IQueryable<City> Cities = _context.Cities;

            if (queryParameters != null)
            {
                //expanding related data
                if (queryParameters.expand != null && queryParameters.expand.Length != 0)
                {
                    Cities = Cities.Expand(queryParameters.expand);
                }
            }
            return await Cities.ToListAsync();
        }
        public async Task Add(City city)
        {
            await _context.AddAsync(city);
            await _context.SaveChangesAsync();
        }
    }
}

