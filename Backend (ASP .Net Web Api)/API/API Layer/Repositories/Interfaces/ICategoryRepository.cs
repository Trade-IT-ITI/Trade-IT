using DatabaseLayer.Models;
using API_Layer.QueryParameters;

namespace API_Layer.Repositories.Interfaces
{
    public interface ICategoryRepository :IRepository<Category>
    {
        Task<List<Category>> GetAll(QueryParameter queryParameter);
    }
}
