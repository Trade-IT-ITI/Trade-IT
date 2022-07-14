using API_Layer.DataModels;
using API_Layer.QueryParameters;
using DatabaseLayer.Models;

namespace API_Layer.Repositories.Interfaces
{
    public interface IProductRepository //: IRepository<Product>
    {
        Task<ProductsData> GetAll(ProductQueryParameter queryParameters);
        Task Add(Product product , IFormFile image);
    }

}
