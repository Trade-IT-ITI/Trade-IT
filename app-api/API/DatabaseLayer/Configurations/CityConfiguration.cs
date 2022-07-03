using DatabaseLayer.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DatabaseLayer.Configurations
{
    public class CityConfiguration : IEntityTypeConfiguration<City>
    {
        public void Configure(EntityTypeBuilder<City> builder)
        {
            builder.HasMany(c => c.Areas).WithOne(p => p.City).OnDelete(DeleteBehavior.NoAction);
            builder.HasMany(c => c.Products).WithOne(p => p.City).OnDelete(DeleteBehavior.NoAction);

            builder.HasData(
                new City() { CityId = 1 , Name = "Cairo" } ,
                new City() { CityId = 2 , Name = "Giza" } ,
                new City() { CityId = 3 , Name = "Mansoura" }
                );
        }
    }
}
