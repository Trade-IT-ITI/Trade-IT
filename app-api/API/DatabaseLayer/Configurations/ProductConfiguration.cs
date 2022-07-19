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
            builder.Property(p => p.ViewsCount).HasDefaultValue(0);
            builder.Property(p => p.RequestCount).HasDefaultValue(0);
            builder.Property(p => p.StatusId).HasDefaultValue(1);
            builder.Property(x => x.PostDateTime).HasDefaultValueSql("getdate()");
            builder.HasData(
                new Product()
                {
                    ProductId = 1 ,
                    Title = "Lenovo Ideapad 330" ,
                    Descrioption = "Lenovo Ideapad 330 Laptop, Intel Core i3-7020U, 15.6 Inch, 1TB, 4GB RAM, DOS - Platinum Grey" ,
                    PostDateTime = new DateTime(2022 , 06 , 15) ,
                    RequestCount = 2 ,
                    ViewsCount = 20 ,
                    StatusId = 1 ,
                    SubcategoryId = 1 ,
                    CityId = 1 ,
                    AreaId = 2 ,
                    Price = 8000 ,
                    UserId = 2 ,
                    ProductImages = new List<ProductImage>() { }
                } ,
                new Product()
                {
                    ProductId = 2 ,
                    Title = "Redmi note 9" ,
                    Descrioption = "Redmi Note 9 is equipped with a high-performance octa-core processor with a maximum clock speed of 3.0GHz, a GPU frequency of 1000MHz, for improved performance to provide you with a seamless gaming experience and implement your ideas." ,
                    PostDateTime = new DateTime(2022 , 06 , 28) ,
                    RequestCount = 10 ,
                    ViewsCount = 88 ,
                    StatusId = 2 ,
                    SubcategoryId = 2 ,
                    CityId = 2 ,
                    AreaId = 3 ,
                    Price = 3450 ,
                    UserId = 1
                } ,
                new Product()
                {
                    ProductId = 3 ,
                    Title = "Gaming Chair ITop 220" ,
                    Descrioption = "new gaming chair 2022 model" ,
                    PostDateTime = new DateTime(2022 , 05 , 12) ,
                    RequestCount = 5 ,
                    ViewsCount = 60 ,
                    StatusId = 1 ,
                    SubcategoryId = 3 ,
                    CityId = 3 ,
                    AreaId = 5 ,
                    Price = 6500 ,
                    UserId = 2
                } ,
                new Product()
                {
                    ProductId = 4 ,
                    Title = "children shirt" ,
                    Descrioption = "children shirt small and medium sizes" ,
                    PostDateTime = new DateTime(2022 , 06 , 28) ,
                    RequestCount = 3 ,
                    ViewsCount = 110 ,
                    StatusId = 1 ,
                    SubcategoryId = 4 ,
                    CityId = 3 ,
                    AreaId = 6 ,
                    Price = 50 ,
                    UserId = 2 ,
                } ,
                new Product()
                {
                    ProductId = 5 ,
                    Title = "boys t-shirt" ,
                    Descrioption = "boys t-shirt medium and large sizes" ,
                    PostDateTime = new DateTime(2022 , 01 , 13) ,
                    RequestCount = 1 ,
                    ViewsCount = 90 ,
                    StatusId = 2 ,
                    SubcategoryId = 7 ,
                    CityId = 1 ,
                    AreaId = 1 ,
                    Price = 100 ,
                    UserId = 1
                } ,
                new Product()
                {
                    ProductId = 6 ,
                    Title = "girls dress" ,
                    Descrioption = "girls dress medium and large sizes" ,
                    PostDateTime = new DateTime(2021 , 12 , 05) ,
                    RequestCount = 0 ,
                    ViewsCount = 5 ,
                    StatusId = 2 ,
                    SubcategoryId = 8 ,
                    CityId = 2 ,
                    AreaId = 4 ,
                    Price = 250 ,
                    UserId = 1
                }
            );
        }
    }
}