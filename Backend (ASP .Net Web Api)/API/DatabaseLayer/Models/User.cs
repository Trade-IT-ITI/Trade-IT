using DatabaseLayer.Helper;
using Microsoft.AspNetCore.Identity;

namespace DatabaseLayer.Models
{
    public class User:IdentityUser
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Phone { get; set; }
        public virtual ICollection<Favourite> Favourites { get; set; }
        public virtual ICollection<Product> Products { get; set; }
    }
}
