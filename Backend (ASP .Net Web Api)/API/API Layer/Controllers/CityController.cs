using API_Layer.QueryParameters;
using API_Layer.Repositories.Interfaces;
using DatabaseLayer.Models;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace API_Layer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CityController : ControllerBase
    {

        private readonly ICityRepository repository;
        public CityController(ICityRepository repository)
        {
            this.repository = repository;
        }
        //getAll
        [HttpGet]
        public async Task<IActionResult> GetAll([FromQuery] QueryParameter queryParameters)
        {
            return Ok(await repository.GetAll(queryParameters));
        }

        //add new city
        [HttpPost]
        public async Task<IActionResult> Add([FromBody] City city)
        {
            try
            {
                await repository.Add(city);
                return Created("url" , city);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

    }
}
