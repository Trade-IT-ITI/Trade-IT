using API_Layer.QueryParameters;
using API_Layer.Repositories.Interfaces;
using DatabaseLayer.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API_Layer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class InstructionController : ControllerBase
    {
        private readonly IInstructionRepository instructionRepository;

        public InstructionController(IInstructionRepository instructionRepository)
        {
            this.instructionRepository = instructionRepository;
        }
        [HttpGet]
        public async Task<IActionResult> GetAll([FromQuery] QueryParameter queryParameters)
        {
            return Ok(await instructionRepository.GetAll(queryParameters));
        }
        [HttpPost]
        public async Task<IActionResult> Add(Instruction instruction)
        {
            try
            {
                await instructionRepository.Add(instruction);
                return Created("url", instruction);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
