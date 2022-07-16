using API_Layer.Repositories.Interfaces;
using DatabaseLayer.Helper;
using DatabaseLayer.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API_Layer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IUserRepository _userRepository;
        public UserController(IUserRepository userRepository)
        {
            _userRepository = userRepository;
        }
        [HttpPost("Login")]
        public async Task<IActionResult> Login(string email , string password,int type)
        {
            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
                return BadRequest("email and password are required");

            var user = await _userRepository.GetByEmail(email);
            if (user == null)
                return NotFound("no user exists with this email");

            if (user.Password != password.ToLower())
                return NotFound("wrong password");

            //need for editing for safe casting 
            if (user.Type != (UserType)type)
                return NotFound("There is no such a user");

            return Ok(user);
        }
        [HttpPost("Register")]
        public async Task<IActionResult> Register(User user)
        {
            try
            {
                await _userRepository.Add(user);
                return Ok(user);
            }
            catch
            {
                return BadRequest();
            }
        }
    }
}
