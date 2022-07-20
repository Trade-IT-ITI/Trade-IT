using DatabaseLayer.Helper;
using System.ComponentModel.DataAnnotations;

namespace API_Layer.DataModels
{
    public class EditUserData
    {
        public int ID { get; set; }
        public string firstName { get; set; }
        public string lastName { get; set; }
        public string Email { get; set; }
        public string phone { get; set; }
    }
}
