using API_Layer.Helper;
using API_Layer.QueryParameters;
using API_Layer.Repositories.Interfaces;
using DatabaseLayer.Data;
using DatabaseLayer.Models;
using Microsoft.EntityFrameworkCore;

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

        public async Task<List<Instruction>> GetAll(QueryParameter queryParameters)
        {
            IQueryable<Instruction> Instructions = context.Instructions;

            if (queryParameters != null)
            {
                //expanding related data
                if (queryParameters.expand != null && queryParameters.expand.Length != 0)
                {
                    Instructions = Instructions.Expand(queryParameters.expand);
                }
            }
            return await Instructions.ToListAsync();
        }
    }
}
