using API_Layer.DataModels;
using API_Layer.QueryParameters;

namespace API_Layer.Repositories.Interfaces
{
    public interface IProductsDetailsRepository
    {
        Task<ProductsDetails> GetProductsDetails(ProductsDetialsQueryParameters queryParameters);
    }
}
