using DatabaseLayer.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DatabaseLayer
{
    public class BuyOptionConfiguration : IEntityTypeConfiguration<BuyOption>
    {
        public void Configure(EntityTypeBuilder<BuyOption> builder)
        {
        }
    }
}