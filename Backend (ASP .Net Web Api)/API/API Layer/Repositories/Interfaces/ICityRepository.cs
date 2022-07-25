using API_Layer.QueryParameters;
using DatabaseLayer.Models;

namespace API_Layer.Repositories.Interfaces
{
    public interface ICityRepository:IRepository<City>
    {
        Task<List<City>> GetAll(QueryParameter queryParameter);

    }
}
