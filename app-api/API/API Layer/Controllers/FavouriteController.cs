using API_Layer.Repositories.Interfaces;
using DatabaseLayer.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API_Layer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FavouriteController : ControllerBase
    {
        private readonly IFavouriteRepository favouriteRepository;

        public FavouriteController(IFavouriteRepository favouriteRepository)
        {
            this.favouriteRepository = favouriteRepository;
        }

        [HttpPost]
        public async Task<IActionResult> Add(Favourite favourite)
        {
            try
            {
                await favouriteRepository.Add(favourite);
                return Created("url", favourite);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

        }
    }
}
