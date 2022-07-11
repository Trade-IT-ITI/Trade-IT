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
                new Subcategory() { SubcategoryId = 2 , Name = "Mobiles" , CategoryId = 1 } ,
                new Subcategory() { SubcategoryId = 3 , Name = "Chairs" , CategoryId = 2 } ,
                new Subcategory() { SubcategoryId = 4 , Name = "Children" , CategoryId = 3 } ,
                new Subcategory() { SubcategoryId = 5 , Name = "Men" , CategoryId = 3 } ,
                new Subcategory() { SubcategoryId = 6 , Name = "Women" , CategoryId = 3 } ,
                new Subcategory() { SubcategoryId = 7 , Name = "Boys" , CategoryId = 3 },
                new Subcategory() { SubcategoryId = 8 , Name = "Girls" , CategoryId = 3 } 
                );
        }
    }
}