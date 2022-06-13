namespace DatabaseLayer.Models
{
    public class User
    {
        public int UserId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Phone { get; set; }

        public ICollection<Favourite> Favourites { get; set; }
        public ICollection<Product> Products { get; set; }
    }
}
