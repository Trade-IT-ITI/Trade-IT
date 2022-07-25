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
                new ProductImage() { ProductImageId = 1 , ProductId = 1 , Name = "lenovo1.jpg" } ,
                new ProductImage() { ProductImageId = 2 , ProductId = 1 , Name = "lenovo2.jpg" } ,
                new ProductImage() { ProductImageId = 3 , ProductId = 2 , Name = "152419-review-hands-on-redmi-note-9-image1-rr6mm2jbpp.jpg" } ,
                new ProductImage() { ProductImageId = 4 , ProductId = 3 , Name = "nacon-gaming-chair-blue-pcch-310-bl.jpg" } ,
                new ProductImage() { ProductImageId = 5 , ProductId = 4 , Name = "New-Summer-Children-shirts-Printing-Anchor-pattern-Cotton-100-Short-sleeved-Boy-s-shirts-Fit-for.jpg" } ,
                new ProductImage() { ProductImageId = 6 , ProductId = 5 , Name = "16828269_35035155_300.jpg" } ,
                new ProductImage() { ProductImageId = 7 , ProductId = 6 , Name = "c827e760-197a-4dde-83fe-2975d46017de_large.jpg" }
                );
        }
    }
}