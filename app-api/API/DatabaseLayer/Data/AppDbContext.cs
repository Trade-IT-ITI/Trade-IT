﻿using DatabaseLayer.Models;
using Microsoft.EntityFrameworkCore;

namespace DatabaseLayer.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext()
        {

        }
        public AppDbContext(DbContextOptions options) : base(options)
        {

        }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer("server=.;database=TradeIt;trusted_connection=true;");
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {

        }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<Ad> Ads { get; set; }
        public virtual DbSet<BuyOption> BuyOptions { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        //public virtual DbSet<CategoryInstruction> CategoriesInstructions { get; set; }
        public virtual DbSet<Detail> Details { get; set; }
        //public virtual DbSet<Favourite> Favourites { get; set; }
        public virtual DbSet<Instruction> Instructions { get; set; }
        public virtual DbSet<Notification> Notifications { get; set; }
        //public virtual DbSet<ProductBuyOption> ProductsBuyOptions { get; set; }
        public virtual DbSet<SliderImage> SliderImages { get; set; }
        public virtual DbSet<Status> Statuses { get; set; }
        public virtual DbSet<Subcategory> Subcategories { get; set; }
        //public virtual DbSet<SubcategoryDetail> SubcategoriesDetails { get; set; }
        public virtual DbSet<User> Users { get; set; }

    }
}