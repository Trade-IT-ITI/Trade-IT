﻿using DatabaseLayer.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DatabaseLayer
{
    public class CategoryConfiguration : IEntityTypeConfiguration<Category>
    {
        public void Configure(EntityTypeBuilder<Category> builder)
        {
            builder.HasData(
                new Category() { CategoryId = 1 , Name = "Electronics" },
                new Category() { CategoryId = 2 , Name = "Furniture" },
                new Category() { CategoryId = 3 , Name = "Clothes" } 
                );
        }
    }
}