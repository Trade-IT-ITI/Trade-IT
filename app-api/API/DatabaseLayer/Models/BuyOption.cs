namespace DatabaseLayer.Models
{
    public class BuyOption
    {
        public int BuyOptionId { get; set; }
        public string Name { get; set; }

        public ICollection<ProductBuyOption> ProductBuyOptions { get; set; }
    }
}
