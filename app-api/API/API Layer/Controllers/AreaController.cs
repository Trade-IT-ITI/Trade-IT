using API_Layer.QueryParameters;
using API_Layer.Repositories.Interfaces;
using DatabaseLayer.Models;
using Microsoft.AspNetCore.Mvc;

namespace API_Layer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AreaController : Controller
    {
        private readonly IAreaRepository repository;
        public AreaController(IAreaRepository repository)
        {
            this.repository = repository;
        }
        //getAll
        [HttpGet]
        public async Task<IActionResult> GetAll([FromQuery] QueryParameter queryParameters)
        {
            return Ok(await repository.GetAll(queryParameters));
        }

        //add new area
        [HttpPost]
        public async Task<IActionResult> Add([FromBody] Area area)
        {
            try
            {
                await repository.Add(area);
                return Created("url" , area);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
