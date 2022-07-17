namespace DatabaseLayer.Models
{
    public class Status
    {
        public int StatusId { get; set; }
        public string Name { get; set; }

        public virtual ICollection<Product> Products { get; set; }
    }
}
