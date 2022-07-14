using API_Layer.Repositories.Interfaces;
using DatabaseLayer.Models;
using Microsoft.AspNetCore.Mvc;
using API_Layer.QueryParameters;

namespace API_Layer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SubcategoryController : ControllerBase
    {
        private readonly ISubcategoryRepository subcategoryRepository;
        public SubcategoryController(ISubcategoryRepository subcategoryRepository)
        {
            this.subcategoryRepository = subcategoryRepository;
        }
        [HttpGet]
        public async Task<IActionResult> GetAll([FromQuery] QueryParameter queryParameters)
        {
            return Ok(await subcategoryRepository.GetAll(queryParameters));
        }
        [HttpPost]
        public async Task<IActionResult> Add(Subcategory subcategory)
        {
            try
            {
                await subcategoryRepository.Add(subcategory);
                return Created("url", subcategory);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
