using DatabaseLayer.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DatabaseLayer
{
    public class ProductImageConfiguration : IEntityTypeConfiguration<ProductImage>
    {
        public void Configure(EntityTypeBuilder<ProductImage> builder)
        {
            builder.HasData(
                new ProductImage() { ProductImageId = 1 , Name = "lenovo_x1.jpg" , ProductId = 1 } ,
                new ProductImage() { ProductImageId = 2 , Name = "lenovo_x1_2.jpg" , ProductId = 1 } 
                );
        }
    }
}