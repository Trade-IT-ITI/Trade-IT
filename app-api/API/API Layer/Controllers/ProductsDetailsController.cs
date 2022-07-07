using API_Layer.DataModels;
using API_Layer.QueryParameters;
using API_Layer.Repositories.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API_Layer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsDetailsController : ControllerBase
    {
        private readonly IProductsDetailsRepository repository;

        public ProductsDetailsController(IProductsDetailsRepository repository)
        {
            this.repository = repository;
        }
        [HttpGet]
        public ProductsDetails Get([FromQuery] ProductsDetialsQueryParameters queryParameters)
        {
            return repository.GetProductsDetails(queryParameters).Result;
        }
    }
}
