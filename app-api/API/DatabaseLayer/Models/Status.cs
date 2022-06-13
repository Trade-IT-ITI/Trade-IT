namespace DatabaseLayer.Models
{
    public class Status
    {
        public int StatusId { get; set; }
        public string Name { get; set; }

        public ICollection<Product> Products { get; set; }
    }
}
