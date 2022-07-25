using DatabaseLayer.Helper;
namespace DatabaseLayer.Models
{
    public class Ad
    {
        public int AdID { get; set; }
        public AdLevel Level { get; set; }
        public DateTime ExpireDate { get; set; }

        public virtual Product Product { get; set; }
        public int ProductId { get; set; }
    }
}
