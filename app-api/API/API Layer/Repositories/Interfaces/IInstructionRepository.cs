using DatabaseLayer.Models;

namespace API_Layer.Repositories.Interfaces
{
    public interface IInstructionRepository : IRepository<Instruction>
    {

        Task<List<Instruction>> GetAll();

    }
}
