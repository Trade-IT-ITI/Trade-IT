using API_Layer.QueryParameters;
using API_Layer.Repositories.Interfaces;
using DatabaseLayer.Data;
using DatabaseLayer.Models;

namespace API_Layer.Repositories
{
    public class InstructionRepository : IInstructionRepository
    {
        private readonly AppDbContext context;

        public InstructionRepository(AppDbContext context)
        {
            this.context = context;
        }

        public async Task Add(Instruction instruction)
        {
            await context.AddAsync(instruction);
            await context.SaveChangesAsync();
        }

        public Task<List<Instruction>> GetAll()
        {
            throw new NotImplementedException();
        }
    }
}
