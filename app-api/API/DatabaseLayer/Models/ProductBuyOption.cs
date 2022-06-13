namespace DatabaseLayer.Models
{
    public class ProductBuyOption
    {
        public Product Product { get; set; }
        public int ProductId { get; set; }

        public BuyOption BuyOption { get; set; }
        public int BuyOptionId { get; set; }

        public Subcategory Subcategory { get; set; }
        public int? SubcategoryId { get; set; }


        public string Description { get; set; }
        public double Price { get; set; }
    }
}
