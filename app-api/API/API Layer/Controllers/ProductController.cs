using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using API_Layer.Repositories;
using DatabaseLayer.Models;
using API_Layer.Repositories.Interfaces;
using DatabaseLayer.Data;
using Microsoft.EntityFrameworkCore;
using API_Layer.QueryParameters;

namespace API_Layer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        private readonly IRepository <Product> _productRepository;
        public ProductController(IRepository<Product> productRepository)
        {
            _productRepository = productRepository;
        }
        //getAll
        [HttpGet]
        public async Task<IActionResult> get([FromQuery]ProductQueryParameters queryParameters)
        {
            return Ok(await _productRepository.GetAll(queryParameters));
        }
    }
}
