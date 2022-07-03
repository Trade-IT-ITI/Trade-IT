﻿// <auto-generated />
using System;
using DatabaseLayer.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

#nullable disable

namespace DatabaseLayer.Migrations
{
    [DbContext(typeof(AppDbContext))]
    partial class AppDbContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "6.0.6")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder, 1L, 1);

            modelBuilder.Entity("DatabaseLayer.Models.Ad", b =>
                {
                    b.Property<int>("AdID")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("AdID"), 1L, 1);

                    b.Property<DateTime>("ExpireDate")
                        .HasColumnType("datetime2");

                    b.Property<int>("Level")
                        .HasColumnType("int");

                    b.Property<int>("ProductId")
                        .HasColumnType("int");

                    b.HasKey("AdID");

                    b.HasIndex("ProductId");

                    b.ToTable("Ads");
                });

            modelBuilder.Entity("DatabaseLayer.Models.Area", b =>
                {
                    b.Property<int>("AreaId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("AreaId"), 1L, 1);

                    b.Property<int>("CityId")
                        .HasColumnType("int");

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("AreaId");

                    b.HasIndex("CityId");

                    b.ToTable("Area");

                    b.HasData(
                        new
                        {
                            AreaId = 1,
                            CityId = 1,
                            Name = "Ain Shams"
                        },
                        new
                        {
                            AreaId = 2,
                            CityId = 1,
                            Name = "Al Mataryah"
                        },
                        new
                        {
                            AreaId = 3,
                            CityId = 2,
                            Name = "Al Haram"
                        },
                        new
                        {
                            AreaId = 4,
                            CityId = 2,
                            Name = "Imbaba"
                        },
                        new
                        {
                            AreaId = 5,
                            CityId = 3,
                            Name = "Samyah El Gamal St"
                        },
                        new
                        {
                            AreaId = 6,
                            CityId = 3,
                            Name = "AL Sadr Hospital"
                        });
                });

            modelBuilder.Entity("DatabaseLayer.Models.BuyOption", b =>
                {
                    b.Property<int>("BuyOptionId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("BuyOptionId"), 1L, 1);

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("BuyOptionId");

                    b.ToTable("BuyOptions");
                });

            modelBuilder.Entity("DatabaseLayer.Models.Category", b =>
                {
                    b.Property<int>("CategoryId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("CategoryId"), 1L, 1);

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("CategoryId");

                    b.ToTable("Categories");

                    b.HasData(
                        new
                        {
                            CategoryId = 1,
                            Name = "Electronics"
                        });
                });

            modelBuilder.Entity("DatabaseLayer.Models.CategoryInstruction", b =>
                {
                    b.Property<int>("CategoryId")
                        .HasColumnType("int");

                    b.Property<int>("InsturctionId")
                        .HasColumnType("int");

                    b.Property<int?>("InstructionId")
                        .HasColumnType("int");

                    b.HasKey("CategoryId", "InsturctionId");

                    b.HasIndex("InstructionId");

                    b.ToTable("CategoriesInstructions");
                });

            modelBuilder.Entity("DatabaseLayer.Models.City", b =>
                {
                    b.Property<int>("CityId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("CityId"), 1L, 1);

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("CityId");

                    b.ToTable("City");

                    b.HasData(
                        new
                        {
                            CityId = 1,
                            Name = "Cairo"
                        },
                        new
                        {
                            CityId = 2,
                            Name = "Giza"
                        },
                        new
                        {
                            CityId = 3,
                            Name = "Mansoura"
                        });
                });

            modelBuilder.Entity("DatabaseLayer.Models.Favourite", b =>
                {
                    b.Property<int>("UserId")
                        .HasColumnType("int");

                    b.Property<int>("ProductId")
                        .HasColumnType("int");

                    b.HasKey("UserId", "ProductId");

                    b.HasIndex("ProductId");

                    b.ToTable("Favourites");
                });

            modelBuilder.Entity("DatabaseLayer.Models.Instruction", b =>
                {
                    b.Property<int>("InstructionId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("InstructionId"), 1L, 1);

                    b.Property<string>("Text")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("InstructionId");

                    b.ToTable("Instructions");
                });

            modelBuilder.Entity("DatabaseLayer.Models.Notification", b =>
                {
                    b.Property<int>("NotificationId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("NotificationId"), 1L, 1);

                    b.Property<string>("Body")
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime>("DateTime")
                        .HasColumnType("datetime2");

                    b.Property<int>("ProductId")
                        .HasColumnType("int");

                    b.Property<string>("Title")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("NotificationId");

                    b.HasIndex("ProductId");

                    b.ToTable("Notifications");
                });

            modelBuilder.Entity("DatabaseLayer.Models.Product", b =>
                {
                    b.Property<int>("ProductId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("ProductId"), 1L, 1);

                    b.Property<int>("AreaId")
                        .HasColumnType("int");

                    b.Property<int>("CityId")
                        .HasColumnType("int");

                    b.Property<string>("Descrioption")
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime>("PostDateTime")
                        .HasColumnType("datetime2");

                    b.Property<double>("Price")
                        .HasColumnType("float");

                    b.Property<int>("RequestCount")
                        .HasColumnType("int");

                    b.Property<int>("StatusId")
                        .HasColumnType("int");

                    b.Property<int>("SubcategoryId")
                        .HasColumnType("int");

                    b.Property<string>("Title")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("UserId")
                        .HasColumnType("int");

                    b.Property<int>("ViewsCount")
                        .HasColumnType("int");

                    b.HasKey("ProductId");

                    b.HasIndex("AreaId");

                    b.HasIndex("CityId");

                    b.HasIndex("StatusId");

                    b.HasIndex("SubcategoryId");

                    b.HasIndex("UserId");

                    b.ToTable("Products");

                    b.HasData(
                        new
                        {
                            ProductId = 1,
                            AreaId = 2,
                            CityId = 1,
                            Descrioption = "Lenovo Ideapad 330 Laptop, Intel Core i3-7020U, 15.6 Inch, 1TB, 4GB RAM, DOS - Platinum Grey",
                            PostDateTime = new DateTime(2022, 6, 15, 0, 0, 0, 0, DateTimeKind.Unspecified),
                            Price = 8000.0,
                            RequestCount = 2,
                            StatusId = 1,
                            SubcategoryId = 1,
                            Title = "Lenovo Ideapad 330",
                            UserId = 2,
                            ViewsCount = 20
                        },
                        new
                        {
                            ProductId = 2,
                            AreaId = 1,
                            CityId = 2,
                            Descrioption = "Redmi Note 9 is equipped with a high-performance octa-core processor with a maximum clock speed of 3.0GHz, a GPU frequency of 1000MHz, for improved performance to provide you with a seamless gaming experience and implement your ideas.",
                            PostDateTime = new DateTime(2022, 6, 28, 0, 0, 0, 0, DateTimeKind.Unspecified),
                            Price = 3450.0,
                            RequestCount = 10,
                            StatusId = 2,
                            SubcategoryId = 2,
                            Title = "Redmi note 9",
                            UserId = 1,
                            ViewsCount = 88
                        });
                });

            modelBuilder.Entity("DatabaseLayer.Models.ProductBuyOption", b =>
                {
                    b.Property<int>("ProductId")
                        .HasColumnType("int");

                    b.Property<int>("BuyOptionId")
                        .HasColumnType("int");

                    b.Property<string>("Description")
                        .HasColumnType("nvarchar(max)");

                    b.Property<double>("Price")
                        .HasColumnType("float");

                    b.Property<int?>("SubcategoryId")
                        .HasColumnType("int");

                    b.HasKey("ProductId", "BuyOptionId");

                    b.HasIndex("BuyOptionId");

                    b.HasIndex("SubcategoryId");

                    b.ToTable("ProductsBuyOptions");
                });

            modelBuilder.Entity("DatabaseLayer.Models.ProductImage", b =>
                {
                    b.Property<int>("ProductImageId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("ProductImageId"), 1L, 1);

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("ProductId")
                        .HasColumnType("int");

                    b.HasKey("ProductImageId");

                    b.HasIndex("ProductId");

                    b.ToTable("ProductsImages");

                    b.HasData(
                        new
                        {
                            ProductImageId = 1,
                            Name = "Lenovo-1.jpeg",
                            ProductId = 1
                        },
                        new
                        {
                            ProductImageId = 2,
                            Name = "Lenovo-2.jpeg",
                            ProductId = 1
                        },
                        new
                        {
                            ProductImageId = 3,
                            Name = "Lenovo-3.jpeg",
                            ProductId = 1
                        },
                        new
                        {
                            ProductImageId = 4,
                            Name = "Lenovo-4.jpeg",
                            ProductId = 1
                        },
                        new
                        {
                            ProductImageId = 5,
                            Name = "RedmiNote9-1.png",
                            ProductId = 2
                        },
                        new
                        {
                            ProductImageId = 6,
                            Name = "RedmiNote9-2.png",
                            ProductId = 2
                        },
                        new
                        {
                            ProductImageId = 7,
                            Name = "RedmiNote9-3.png",
                            ProductId = 2
                        });
                });

            modelBuilder.Entity("DatabaseLayer.Models.SliderImage", b =>
                {
                    b.Property<int>("SliderImageId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("SliderImageId"), 1L, 1);

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("SliderText")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("SliderImageId");

                    b.ToTable("SliderImages");
                });

            modelBuilder.Entity("DatabaseLayer.Models.Status", b =>
                {
                    b.Property<int>("StatusId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("StatusId"), 1L, 1);

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("StatusId");

                    b.ToTable("Statuses");

                    b.HasData(
                        new
                        {
                            StatusId = 1,
                            Name = "Staged"
                        },
                        new
                        {
                            StatusId = 2,
                            Name = "Sold"
                        });
                });

            modelBuilder.Entity("DatabaseLayer.Models.Subcategory", b =>
                {
                    b.Property<int>("SubcategoryId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("SubcategoryId"), 1L, 1);

                    b.Property<int>("CategoryId")
                        .HasColumnType("int");

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("SubcategoryId");

                    b.HasIndex("CategoryId");

                    b.ToTable("Subcategories");

                    b.HasData(
                        new
                        {
                            SubcategoryId = 1,
                            CategoryId = 1,
                            Name = "Laptops"
                        },
                        new
                        {
                            SubcategoryId = 2,
                            CategoryId = 1,
                            Name = "Mobiles"
                        });
                });

            modelBuilder.Entity("DatabaseLayer.Models.User", b =>
                {
                    b.Property<int>("UserId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("UserId"), 1L, 1);

                    b.Property<string>("FirstName")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("LastName")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Phone")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("UserId");

                    b.ToTable("Users");

                    b.HasData(
                        new
                        {
                            UserId = 1,
                            FirstName = "Abdelrahman",
                            LastName = "Ahmed",
                            Phone = "01155661788"
                        },
                        new
                        {
                            UserId = 2,
                            FirstName = "Marwan",
                            LastName = "Sayed",
                            Phone = "01524556671"
                        });
                });

            modelBuilder.Entity("DatabaseLayer.Models.Ad", b =>
                {
                    b.HasOne("DatabaseLayer.Models.Product", "Product")
                        .WithMany()
                        .HasForeignKey("ProductId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Product");
                });

            modelBuilder.Entity("DatabaseLayer.Models.Area", b =>
                {
                    b.HasOne("DatabaseLayer.Models.City", "City")
                        .WithMany("Areas")
                        .HasForeignKey("CityId")
                        .OnDelete(DeleteBehavior.NoAction)
                        .IsRequired();

                    b.Navigation("City");
                });

            modelBuilder.Entity("DatabaseLayer.Models.CategoryInstruction", b =>
                {
                    b.HasOne("DatabaseLayer.Models.Category", "Category")
                        .WithMany("CategoryInstructions")
                        .HasForeignKey("CategoryId")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.HasOne("DatabaseLayer.Models.Instruction", "Instruction")
                        .WithMany("CategoryInstructions")
                        .HasForeignKey("InstructionId")
                        .OnDelete(DeleteBehavior.Restrict);

                    b.Navigation("Category");

                    b.Navigation("Instruction");
                });

            modelBuilder.Entity("DatabaseLayer.Models.Favourite", b =>
                {
                    b.HasOne("DatabaseLayer.Models.Product", "Product")
                        .WithMany("Favourites")
                        .HasForeignKey("ProductId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("DatabaseLayer.Models.User", "User")
                        .WithMany("Favourites")
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Product");

                    b.Navigation("User");
                });

            modelBuilder.Entity("DatabaseLayer.Models.Notification", b =>
                {
                    b.HasOne("DatabaseLayer.Models.Product", "Product")
                        .WithMany("Notifications")
                        .HasForeignKey("ProductId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Product");
                });

            modelBuilder.Entity("DatabaseLayer.Models.Product", b =>
                {
                    b.HasOne("DatabaseLayer.Models.Area", "Area")
                        .WithMany("Products")
                        .HasForeignKey("AreaId")
                        .OnDelete(DeleteBehavior.NoAction)
                        .IsRequired();

                    b.HasOne("DatabaseLayer.Models.City", "City")
                        .WithMany("Products")
                        .HasForeignKey("CityId")
                        .OnDelete(DeleteBehavior.NoAction)
                        .IsRequired();

                    b.HasOne("DatabaseLayer.Models.Status", "Status")
                        .WithMany("Products")
                        .HasForeignKey("StatusId")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.HasOne("DatabaseLayer.Models.Subcategory", "Subcategory")
                        .WithMany("Products")
                        .HasForeignKey("SubcategoryId")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.HasOne("DatabaseLayer.Models.User", "Owner")
                        .WithMany("Products")
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.Navigation("Area");

                    b.Navigation("City");

                    b.Navigation("Owner");

                    b.Navigation("Status");

                    b.Navigation("Subcategory");
                });

            modelBuilder.Entity("DatabaseLayer.Models.ProductBuyOption", b =>
                {
                    b.HasOne("DatabaseLayer.Models.BuyOption", "BuyOption")
                        .WithMany("ProductBuyOptions")
                        .HasForeignKey("BuyOptionId")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.HasOne("DatabaseLayer.Models.Product", "Product")
                        .WithMany("ProductBuyOptions")
                        .HasForeignKey("ProductId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("DatabaseLayer.Models.Subcategory", "Subcategory")
                        .WithMany("ProductBuyOptions")
                        .HasForeignKey("SubcategoryId");

                    b.Navigation("BuyOption");

                    b.Navigation("Product");

                    b.Navigation("Subcategory");
                });

            modelBuilder.Entity("DatabaseLayer.Models.ProductImage", b =>
                {
                    b.HasOne("DatabaseLayer.Models.Product", "Product")
                        .WithMany("ProductImages")
                        .HasForeignKey("ProductId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Product");
                });

            modelBuilder.Entity("DatabaseLayer.Models.Subcategory", b =>
                {
                    b.HasOne("DatabaseLayer.Models.Category", "Category")
                        .WithMany("Subcategories")
                        .HasForeignKey("CategoryId")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.Navigation("Category");
                });

            modelBuilder.Entity("DatabaseLayer.Models.Area", b =>
                {
                    b.Navigation("Products");
                });

            modelBuilder.Entity("DatabaseLayer.Models.BuyOption", b =>
                {
                    b.Navigation("ProductBuyOptions");
                });

            modelBuilder.Entity("DatabaseLayer.Models.Category", b =>
                {
                    b.Navigation("CategoryInstructions");

                    b.Navigation("Subcategories");
                });

            modelBuilder.Entity("DatabaseLayer.Models.City", b =>
                {
                    b.Navigation("Areas");

                    b.Navigation("Products");
                });

            modelBuilder.Entity("DatabaseLayer.Models.Instruction", b =>
                {
                    b.Navigation("CategoryInstructions");
                });

            modelBuilder.Entity("DatabaseLayer.Models.Product", b =>
                {
                    b.Navigation("Favourites");

                    b.Navigation("Notifications");

                    b.Navigation("ProductBuyOptions");

                    b.Navigation("ProductImages");
                });

            modelBuilder.Entity("DatabaseLayer.Models.Status", b =>
                {
                    b.Navigation("Products");
                });

            modelBuilder.Entity("DatabaseLayer.Models.Subcategory", b =>
                {
                    b.Navigation("ProductBuyOptions");

                    b.Navigation("Products");
                });

            modelBuilder.Entity("DatabaseLayer.Models.User", b =>
                {
                    b.Navigation("Favourites");

                    b.Navigation("Products");
                });
#pragma warning restore 612, 618
        }
    }
}
