using DatabaseLayer.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DatabaseLayer
{
    public class UserConfiguration : IEntityTypeConfiguration<User>
    {
        public void Configure(EntityTypeBuilder<User> builder)
        {
            //builder.HasData(
            //    new User() { UserId = 1 , Email = "abdoahmed@yahoo.com" , Password = "890" , FirstName = "Abdelrahman" , LastName = "Ahmed" , Phone = "01155661788",Type=Helper.UserType.Admon } ,
            //    new User() { UserId = 2 , Email = "marwansayed@gmail.com" , Password = "321" , FirstName = "Marwan" , LastName = "Sayed" , Phone = "01524556671", Type = Helper.UserType.User },
            //    new User() { UserId = 3 , Email = "ali@gmail.com" , Password = "345" , FirstName = "ali" , LastName = "salim" , Phone = "01548574125", Type = Helper.UserType.User }
            //    );
        }
    }
}