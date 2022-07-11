using DatabaseLayer.Models;

namespace API_Layer.DataModels
{
    public class ProductsData
    {
        public List<Product> Products { get; set; }
        public int ProductsCount { get; set; }
    }
}
