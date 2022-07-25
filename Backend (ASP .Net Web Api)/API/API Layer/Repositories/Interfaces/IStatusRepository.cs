using API_Layer.QueryParameters;
using DatabaseLayer.Models;

namespace API_Layer.Repositories.Interfaces
{
    public interface IStatusRepository:IRepository<Status>
    {
        Task<List<Status>> GetAll(QueryParameter queryParameter);

    }
}
