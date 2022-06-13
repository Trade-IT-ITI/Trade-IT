using DatabaseLayer.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DatabaseLayer
{
    public class ProductBuyOptionConfiguration : IEntityTypeConfiguration<ProductBuyOption>
    {
        public void Configure(EntityTypeBuilder<ProductBuyOption> builder)
        {
            builder.HasKey(pbo => new { pbo.ProductId , pbo.BuyOptionId });
            builder.HasOne(pbo=>pbo.BuyOption).WithMany(bo=>bo.ProductBuyOptions).OnDelete(DeleteBehavior.Restrict);
        }
    }
}