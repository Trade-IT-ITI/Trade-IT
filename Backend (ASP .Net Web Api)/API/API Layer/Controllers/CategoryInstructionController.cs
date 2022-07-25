using API_Layer.QueryParameters;
using API_Layer.Repositories.Interfaces;
using DatabaseLayer.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API_Layer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoryInstructionController : ControllerBase
    {
        private readonly ICategoryInstructionRepository categoryInstructionRepository;
        public CategoryInstructionController(ICategoryInstructionRepository subcategoryRepository)
        {
            this.categoryInstructionRepository = subcategoryRepository;
        }
        [HttpGet]
        public async Task<IActionResult> GetAll([FromQuery] QueryParameter queryParameters)
        {
            return Ok(await categoryInstructionRepository.GetAll(queryParameters));
        }
        [HttpPost]
        public async Task<IActionResult> Add(CategoryInstruction categoryInstruction)
        {
            try
            {
                await categoryInstructionRepository.Add(categoryInstruction);
                return Created("url" , categoryInstruction);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
