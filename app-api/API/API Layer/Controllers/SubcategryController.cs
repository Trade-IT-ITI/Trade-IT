using API_Layer.Repositories;
using API_Layer.Repositories.Interfaces;
using DatabaseLayer.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API_Layer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SubcategryController : ControllerBase
    {
        private readonly ISubcategoryRepository subcategoryRepository;
        public SubcategryController(ISubcategoryRepository subcategoryRepository)
        {
            this.subcategoryRepository = subcategoryRepository;
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
