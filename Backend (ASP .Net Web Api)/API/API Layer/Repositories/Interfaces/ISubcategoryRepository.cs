using DatabaseLayer.Models;
using API_Layer.QueryParameters;

namespace API_Layer.Repositories.Interfaces
{
    public interface ISubcategoryRepository : IRepository<Subcategory>
    {
        Task<List<Subcategory>> GetAll(QueryParameter queryParameter);
    }
}
