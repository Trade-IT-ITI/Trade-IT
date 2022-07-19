using DatabaseLayer.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DatabaseLayer
{
    public class InstructionConfiguration : IEntityTypeConfiguration<Instruction>
    {
        public void Configure(EntityTypeBuilder<Instruction> builder)
        {
            builder.HasData(
                new Instruction() { InstructionId = 1 , Text = "you should meet product's owner in a public place" } ,
                new Instruction() { InstructionId = 2 , Text = "it would be better if you brought someone with you to witness selling process" } ,
                new Instruction() { InstructionId = 3 , Text = "check product's battery before buying" } ,
                new Instruction() { InstructionId = 4 , Text = "make sure the cloth have no cuts" } ,
                new Instruction() { InstructionId = 5 , Text = "check the screen well" }
            );
        }
    }
}