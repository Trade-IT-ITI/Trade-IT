using DatabaseLayer.Models;

namespace API_Layer.Repositories.Interfaces
{
    public interface ISubcategoryRepository : IRepository<Subcategory>
    {

        Task<List<Subcategory>> GetAll();

    }
}
