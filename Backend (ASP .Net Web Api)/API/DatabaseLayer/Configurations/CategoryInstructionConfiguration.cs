using DatabaseLayer.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DatabaseLayer
{
    public class CategoryInstructionConfiguration : IEntityTypeConfiguration<CategoryInstruction>
    {
        public void Configure(EntityTypeBuilder<CategoryInstruction> builder)
        {
            builder.HasKey(ci => new { ci.CategoryId , ci.InstructionId });
            builder.HasOne(ci => ci.Category).WithMany(c => c.CategoryInstructions).OnDelete(DeleteBehavior.Restrict);
            builder.HasOne(ci => ci.Instruction).WithMany(i => i.CategoryInstructions).OnDelete(DeleteBehavior.Restrict);

            builder.HasData(
                new CategoryInstruction() { InstructionId = 1 , CategoryId = 1 } ,
                new CategoryInstruction() { InstructionId = 1 , CategoryId = 2 } ,
                new CategoryInstruction() { InstructionId = 1 , CategoryId = 3 } ,
                new CategoryInstruction() { InstructionId = 2 , CategoryId = 1 } ,
                new CategoryInstruction() { InstructionId = 2 , CategoryId = 2 } ,
                new CategoryInstruction() { InstructionId = 2 , CategoryId = 3 } ,
                new CategoryInstruction() { InstructionId = 3 , CategoryId = 1 } ,
                new CategoryInstruction() { InstructionId = 5 , CategoryId = 1 } ,
                new CategoryInstruction() { InstructionId = 4 , CategoryId = 3 }

                );
        }
    }
}