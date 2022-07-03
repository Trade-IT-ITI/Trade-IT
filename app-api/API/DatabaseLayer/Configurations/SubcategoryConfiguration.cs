using DatabaseLayer.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DatabaseLayer
{
    public class SubcategoryConfiguration : IEntityTypeConfiguration<Subcategory>
    {
        public void Configure(EntityTypeBuilder<Subcategory> builder)
        {
            builder.HasOne(s => s.Category).WithMany(c => c.Subcategories).OnDelete(DeleteBehavior.Restrict);
            builder.HasData(
                new Subcategory() { SubcategoryId = 1 , Name = "Laptops" , CategoryId = 1 } ,
                new Subcategory() { SubcategoryId = 2 , Name = "Mobiles" , CategoryId = 1 } 

                );
        }
    }
}