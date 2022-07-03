namespace DatabaseLayer.Models
{
    public class Favourite
    {
        public virtual User User { get; set; }
        public int UserId { get; set; }

        public virtual Product Product { get; set; }
        public int ProductId { get; set; }
    }
}
