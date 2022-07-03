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
    public class AreaConfiguration : IEntityTypeConfiguration<Area>
    {
        public void Configure(EntityTypeBuilder<Area> builder)
        {
            builder.HasMany(a => a.Products).WithOne(p => p.Area).OnDelete(DeleteBehavior.NoAction);
            builder.HasData(
                new Area() { AreaId = 1 , Name = "Ain Shams" , CityId = 1 } ,
                new Area() { AreaId = 2 , Name = "Al Mataryah" , CityId = 1 } ,
                new Area() { AreaId = 3 , Name = "Al Haram" , CityId = 2 } ,
                new Area() { AreaId = 4 , Name = "Imbaba" , CityId = 2 } ,
                new Area() { AreaId = 5 , Name = "Samyah El Gamal St" , CityId = 3 } ,
                new Area() { AreaId = 6 , Name = "AL Sadr Hospital" , CityId = 3 }
                );
        }
    }
}
