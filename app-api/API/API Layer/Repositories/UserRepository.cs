using API_Layer.Repositories.Interfaces;
using DatabaseLayer.Data;
using DatabaseLayer.Models;
using Microsoft.EntityFrameworkCore;

namespace API_Layer.Repositories
{
    public class UserRepository : IUserRepository
    {
        private readonly AppDbContext context;

        public UserRepository(AppDbContext context)
        {
            this.context = context;
        }
        public async Task Add(User user)
        {
            user.Email = user.Email.ToLower();
            if ((await GetByEmail(user.Email)) == null && !string.IsNullOrWhiteSpace(user.Password))
            {
                await context.Users.AddAsync(user);
                await context.SaveChangesAsync();
            }
        }

        public async Task<User> GetByEmail(string email)
        {
            return await context.Users.SingleOrDefaultAsync(u => u.Email == email.ToLower());
        }

        public async Task<User> GetById(int id)
        {
            return await context.Users.FindAsync(id);
        }

    }
}
