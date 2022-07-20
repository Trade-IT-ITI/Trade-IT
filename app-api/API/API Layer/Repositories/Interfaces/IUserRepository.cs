using DatabaseLayer.Models;

namespace API_Layer.Repositories.Interfaces
{
    public interface IUserRepository : IRepository<User>
    {
        Task<User> GetById(int id);
        Task<User> GetByEmail(string email);
        string GenerateToken(User user);
    }
}
