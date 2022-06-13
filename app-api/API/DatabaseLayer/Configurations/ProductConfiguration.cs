using DatabaseLayer.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DatabaseLayer
{
    public class ProductConfiguration : IEntityTypeConfiguration<Product>
    {
        public void Configure(EntityTypeBuilder<Product> builder)
        {
            builder.HasOne(p => p.Status).WithMany(s => s.Products).OnDelete(DeleteBehavior.Restrict);
            builder.HasOne(p => p.Subcategory).WithMany(s => s.Products).OnDelete(DeleteBehavior.Restrict);
            builder.HasOne(p => p.Owner).WithMany(s => s.Products).OnDelete(DeleteBehavior.Restrict);
        }
    }
}