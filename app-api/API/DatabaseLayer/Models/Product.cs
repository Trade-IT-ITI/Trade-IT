namespace DatabaseLayer.Models
{
    public class Product
    {
        public int ProductId { get; set; }
        public string Title { get; set; }
        public string Descrioption { get; set; }
        public DateTime PostDateTime { get; set; }
        public double Price { get; set; }
        public int? RequestCount { get; set; }
        public int? ViewsCount { get; set; }

        public virtual ICollection<Notification> Notifications { get; set; }
        public virtual ICollection<Favourite> Favourites { get; set; }
        public virtual ICollection<ProductImage> ProductImages { get; set; }
        
        public virtual City City { get; set; }
        public int CityId { get; set; }

        public virtual Area Area { get; set; }
        public int AreaId { get; set; }

        public virtual Status Status { get; set; }
        public int StatusId { get; set; }

        public virtual Subcategory Subcategory { get; set; }
        public int SubcategoryId { get; set; }

        public virtual User Owner { get; set; }
        public int UserId { get; set; }
    }
}
