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
        private readonly IRepository<Instruction> instructionRepository;

        public InstructionController(IRepository<Instruction> instructionRepository)
        {
            this.instructionRepository = instructionRepository;
        }
        [HttpPost]
        public async Task<IActionResult> Add(Instruction instruction)
        {
            try
            {
                await instructionRepository.Add(instruction);
                return Created("url", instruction);
            }
            catch
            {
                return BadRequest();
            }
        }
    }
}
