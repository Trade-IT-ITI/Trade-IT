using Microsoft.AspNetCore.Mvc;
using DatabaseLayer.Models;
using API_Layer.Repositories.Interfaces;
using API_Layer.QueryParameters;

namespace API_Layer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoryController : ControllerBase
    {
        private readonly ICategoryRepository repository ;
        public CategoryController(ICategoryRepository repository)
        {
            this.repository = repository;
        }
        //getAll
        [HttpGet]
        public async Task<IActionResult> get()
        {
            return Ok(await repository.GetAll());
        }

        //add new category
        [HttpPost]
        public async Task<IActionResult> post([FromBody] Category category)
        {
            try
            {
            await repository.Add(category);
            return Created("url", category);
            }catch
            {
                return BadRequest();
            }
        }
        
    }
}
