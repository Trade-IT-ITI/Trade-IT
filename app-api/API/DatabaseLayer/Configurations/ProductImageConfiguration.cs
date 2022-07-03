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
                new ProductImage() { ProductImageId = 1 , Name = "Lenovo-1.jpeg" , ProductId = 1 } ,
                new ProductImage() { ProductImageId = 2 , Name = "Lenovo-2.jpeg" , ProductId = 1 } ,
                new ProductImage() { ProductImageId = 3 , Name = "Lenovo-3.jpeg" , ProductId = 1 } ,
                new ProductImage() { ProductImageId = 4 , Name = "Lenovo-4.jpeg" , ProductId = 1 } ,
                new ProductImage() { ProductImageId = 5 , Name = "RedmiNote9-1.png" , ProductId = 2 } ,
                new ProductImage() { ProductImageId = 6 , Name = "RedmiNote9-2.png" , ProductId = 2 } ,
                new ProductImage() { ProductImageId = 7 , Name = "RedmiNote9-3.png" , ProductId = 2 }
                );
        }
    }
}