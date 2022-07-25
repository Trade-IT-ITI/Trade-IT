using DatabaseLayer.Helper;

namespace DatabaseLayer.Models
{
    public class User
    {
        public int UserId { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Phone { get; set; }
        public UserType Type { get; set; }

        public virtual ICollection<Favourite> Favourites { get; set; }
        public virtual ICollection<Product> Products { get; set; }
    }
}
