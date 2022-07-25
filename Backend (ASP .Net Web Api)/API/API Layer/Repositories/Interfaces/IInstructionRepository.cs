using DatabaseLayer.Models;
using API_Layer.QueryParameters;

namespace API_Layer.Repositories.Interfaces
{
    public interface IInstructionRepository : IRepository<Instruction>
    {

        Task<List<Instruction>> GetAll(QueryParameter queryParameter);

    }
}
