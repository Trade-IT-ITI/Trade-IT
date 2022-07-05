using Microsoft.AspNetCore.Mvc;
using DatabaseLayer.Models;
using API_Layer.Repositories.Interfaces;
using API_Layer.QueryParameters;

namespace API_Layer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        private readonly IProductRepository _productRepository;
        public ProductController(IProductRepository productRepository)
        {
            _productRepository = productRepository;
        }
        //getAll
        [HttpGet]
        public async Task<IActionResult> get([FromQuery] ProductQueryParameter queryParameters)
        {
            return Ok(await _productRepository.GetAll(queryParameters));
        }

        //add new Product 
        [HttpPost]
        public async Task<IActionResult> Add([FromForm] Product product, IFormFile image)
        {
            try
            {
                await _productRepository.Add(product, image);
                return Created("url", product);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }



        }
    }
}
