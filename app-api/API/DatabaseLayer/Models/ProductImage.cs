
namespace DatabaseLayer.Models
{
    public class ProductImage
    {
        public int ProductImageId { get; set; }
        public string Name { get; set; }

        public Product Product { get; set; }
        public int ProductId { get; set; }
    }
}
