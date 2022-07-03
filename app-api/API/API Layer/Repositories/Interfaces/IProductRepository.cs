using API_Layer.QueryParameters;
using DatabaseLayer.Models;

namespace API_Layer.Repositories.Interfaces
{
    public interface IProductRepository : IRepository<Product>
    {
        Task<List<Product>> GetAll(ProductQueryParameter queryParameters);
    }
}
