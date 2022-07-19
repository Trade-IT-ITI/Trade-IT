using API_Layer.DataModels;
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
        //get by id
        [HttpGet("{id:int}")]
        public async Task<IActionResult> getById(int id)
        {
            var product = await _userRepository.GetById(id);
            return product != null ? Ok(product) : NotFound();
        }
        [HttpPost("Login")]
        //public async Task<IActionResult> Login( string email ,  string password, int type)
        public async Task<IActionResult> Login(LoginData loginUser)
        {
            if (string.IsNullOrEmpty(loginUser.Email) || string.IsNullOrEmpty(loginUser.Password))
                return BadRequest("email and password are required");

            var user = await _userRepository.GetByEmail(loginUser.Email);
            if (user == null)
                return NotFound("no user exists with this email");

            if (user.Password != loginUser.Password.ToLower())
                return NotFound("wrong password");

            //need for editing for safe casting 
            if (user.Type != loginUser.Type)
                return NotFound("There is no such a user");

            return Ok(user);
        }
        [HttpPost("Register")]
        public async Task<IActionResult> Register([FromBody] RegisterData user)
        {
            try
            {
                User newUser = new User() { Email = user.Email ,FirstName=user.firstName,LastName=user.lastName,Password=user.Password,Phone=user.phone,Type=UserType.User};
                
                await _userRepository.Add(newUser);
                return Ok(newUser);
            }
            catch(Exception e)
            {
                return BadRequest(e.Message);
            }
        }
    }
}
