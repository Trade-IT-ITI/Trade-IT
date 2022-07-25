using API_Layer.QueryParameters;
using DatabaseLayer.Models;

namespace API_Layer.Repositories.Interfaces
{
    public interface ICategoryInstructionRepository:IRepository<CategoryInstruction>
    {
        Task<List<CategoryInstruction>> GetAll(QueryParameter queryParameter);
    }
}
