using DatabaseLayer.Models;

namespace API_Layer.DataModels
{
    public class NewProduct
    {
        public string Title { get; set; }
        public string Descrioption { get; set; }
        public double Price { get; set; }
        public int CityId { get; set; }
        public int AreaId { get; set; }
        public int SubcategoryId { get; set; }
        public int UserId { get; set; }
        public int StatusId { get; set; }
        public IFormFile image { get; set; }
    }
}
