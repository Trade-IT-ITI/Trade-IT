using Microsoft.AspNetCore.Mvc;
using DatabaseLayer.Models;
using API_Layer.Repositories.Interfaces;
using API_Layer.QueryParameters;
using API_Layer.DataModels;
using Microsoft.AspNetCore.Authorization;

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
        //get by id
        [HttpGet("{id:int}")]
        public async Task<IActionResult> getById(int id)
        {
            var product = await _productRepository.GetById(id);
            return product != null ? Ok(product) : NotFound();
        }
        //add new Product 
        //[Authorize]
        [HttpPost]
        public async Task<IActionResult> Add([FromForm] NewProduct product)
        {
            try
            {
                await _productRepository.Add(product);
                return Created("url" , product);
            }


            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        [HttpPut("IncreaseViews")]
        public async Task<IActionResult> IncreaseViews(int id)
        {
            try
            {
                await _productRepository.IncreaseViews(id);
                return Ok();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

        }
        [HttpPut("IncreaseRequests")]
        public async Task<IActionResult> IncreaseRequests(int id)
        {
            try
            {
                await _productRepository.IncreaseRequrests(id);
                return Ok();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

        }
    }
}
