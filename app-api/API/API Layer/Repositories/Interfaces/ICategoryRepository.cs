using DatabaseLayer.Models;

namespace API_Layer.Repositories.Interfaces
{
    public interface ICategoryRepository :IRepository<Category>
    {

        Task<List<Category>> GetAll();

    }
}
