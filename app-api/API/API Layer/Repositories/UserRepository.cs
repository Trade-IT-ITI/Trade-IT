using API_Layer.Repositories.Interfaces;
using DatabaseLayer.Data;
using DatabaseLayer.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace API_Layer.Repositories
{
    public class UserRepository : IUserRepository
    {
        private readonly AppDbContext context;
        private readonly IConfiguration configuration;
        public UserRepository(AppDbContext context , IConfiguration configuration)
        {
            this.context = context;
            this.configuration = configuration;
        }
        public async Task Add(User user)
        {
            await context.Users.AddAsync(user);
            await context.SaveChangesAsync();
        }

        public async Task<User> GetByEmail(string email)
        {
            return await context.Users.SingleOrDefaultAsync(u => u.Email == email.ToLower());
        }

        public async Task<User> GetById(int id)
        {
            return await context.Users.Include(u=>u.Products).Include(u => u.Favourites).FirstOrDefaultAsync(u=>u.UserId==id);
        }

        public string GenerateToken(User user)
        {
            Claim[] claims = new Claim[]
            {
                new Claim(JwtRegisteredClaimNames.Sub, configuration["Jwt:Subject"]),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                new Claim(JwtRegisteredClaimNames.Iat, DateTime.UtcNow.ToString()),
                new Claim("UserId", user.UserId.ToString()),
                new Claim("Email", user.Email),
            };
            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(configuration["Jwt:Key"]));
            var sign = new SigningCredentials(key , SecurityAlgorithms.HmacSha256);
            var token = new JwtSecurityToken(
                configuration["Jwt:Issuer"] ,
                configuration["Jwt:Audience"] ,
                claims ,
                expires: DateTime.UtcNow.AddMinutes(10) ,
                signingCredentials: sign);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }
}
