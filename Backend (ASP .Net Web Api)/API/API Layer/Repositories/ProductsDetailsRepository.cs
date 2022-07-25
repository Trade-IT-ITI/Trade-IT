using DatabaseLayer.Data;
using API_Layer.DataModels;
using API_Layer.QueryParameters;
using API_Layer.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace API_Layer.Repositories
{
    public class ProductsDetailsRepository: IProductsDetailsRepository
    {
        private readonly AppDbContext context;

        public ProductsDetailsRepository(AppDbContext context)
        {
            this.context = context;
        }
        public async Task<ProductsDetails> GetProductsDetails(ProductsDetialsQueryParameters queryParameters)
        {
            ProductsDetails productsDetails = new ProductsDetails();
            if (queryParameters.fetchMaxPrice)
                productsDetails.MaxPrice = await context.Products.MaxAsync(p => p.Price);

            if (queryParameters.fetchMinPrice)
                productsDetails.MinPrice = await context.Products.MinAsync(p => p.Price);

            if (queryParameters.fetchProductsCount)
                productsDetails.ProductsCount = await context.Products.CountAsync();

            return productsDetails;
        }
    }
}
