using DatabaseLayer.Models;

namespace API_Layer.DataModels
{
    public class ProductData
    {
        public int ProductId { get; set; }
        public string Title { get; set; }
        public string Descrioption { get; set; }
        public string City { get; set; }
        public string Area { get; set; }
        public string Status { get; set; }
        public string Category { get; set; }
        public string Subcategory { get; set; }
        public DateTime PostDateTime { get; set; }
        public double Price { get; set; }
        public int? RequestCount { get; set; }
        public int? ViewsCount { get; set; }
        //public User Owner { get; set; }
        public string OwnerFullName { get; set; }
        public string OwnerPhoneNumber { get; set; }
        public List<string> Instructions { get; set; }
        public List<string> ProductImages { get; set; }

    }
}
