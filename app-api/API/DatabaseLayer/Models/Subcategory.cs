namespace DatabaseLayer.Models
{
    public class Subcategory
    {
        public int SubcategoryId { get; set; }
        public string Name { get; set; }


        public Category Category { get; set; }
        public int CategoryId { get; set; }

        public virtual ICollection<Product> Products { get; set; }
        public virtual ICollection<ProductBuyOption> ProductBuyOptions { get; set; }

    }
}
