using DatabaseLayer.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DatabaseLayer
{
    public class UserConfiguration : IEntityTypeConfiguration<User>
    {
        public void Configure(EntityTypeBuilder<User> builder)
        {
            builder.HasData(
                new User() { UserId = 1 , FirstName = "Abdelrahman" , LastName = "Ahmed" , Phone = "01155661788" } ,
                new User() { UserId = 2 , FirstName = "Marwan" , LastName = "Sayed" , Phone = "01524556671" }
                );
        }
    }
}