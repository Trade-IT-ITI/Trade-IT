using API_Layer.Helper;
using API_Layer.QueryParameters;
using API_Layer.Repositories.Interfaces;
using DatabaseLayer.Data;
using DatabaseLayer.Models;
using Microsoft.EntityFrameworkCore;

namespace API_Layer.Repositories
{
    public class StatusRepository : IStatusRepository
    {
        private readonly AppDbContext _context;

        public StatusRepository(AppDbContext context)
        {
            _context = context;
        }
        public async Task<List<Status>> GetAll(QueryParameter queryParameters)
        {
            IQueryable<Status> Statuses = _context.Statuses;

            if (queryParameters != null)
            {
                //expanding related data
                if (queryParameters.expand != null && queryParameters.expand.Length != 0)
                {
                    Statuses = Statuses.Expand(queryParameters.expand);
                }
            }
            return await Statuses.ToListAsync();
        }
        public async Task Add(Status status)
        {
            await _context.AddAsync(status);
            await _context.SaveChangesAsync();
        }
    }
}
