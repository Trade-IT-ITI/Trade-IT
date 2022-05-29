namespace DatabaseLayer.Models
{
    public class Product
    {
        public int ProductId { get; set; }
        public string Title { get; set; }
        public string Descrioption { get; set; }
        public DateTime PostDateTime { get; set; }
        public string City { get; set; }
        public string Area { get; set; }
        public int RequestCount { get; set; }
        public int ViewsCount { get; set; }
    }
}
