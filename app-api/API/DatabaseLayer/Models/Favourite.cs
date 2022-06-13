namespace DatabaseLayer.Models
{
    public class Favourite
    {
        public User User { get; set; }
        public int UserId { get; set; }

        public Product Product { get; set; }
        public int ProductId { get; set; }
    }
}
