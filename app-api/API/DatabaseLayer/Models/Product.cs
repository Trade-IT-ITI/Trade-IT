using System.Reflection;

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
        public double Price { get; set; }
        public int RequestCount { get; set; }
        public int ViewsCount { get; set; }


        public ICollection<Notification> Notifications { get; set; }
        public ICollection<Favourite> Favourites { get; set; }
        public ICollection<ProductImage> ProductImages { get; set; }

        public Status Status { get; set; }
        public int StatusId { get; set; }

        public Subcategory Subcategory { get; set; }
        public int SubcategoryId { get; set; }

        public User Owner { get; set; }
        public int UserId { get; set; }

        public ICollection<ProductBuyOption> ProductBuyOptions { get; set; }

        public Type this[string propertyName]
        {
            get { return typeof(Product).GetProperty(propertyName).GetType(); }
        }
    }
}
