using API_Layer.QueryParameters;
using DatabaseLayer.Models;

namespace API_Layer.Repositories.Interfaces
{
    public interface IAreaRepository : IRepository<Area>
    {
        Task<List<Area>> GetAll(QueryParameter queryParameter);

    }
}
