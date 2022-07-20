using DatabaseLayer.Helper;
using System.ComponentModel.DataAnnotations;

namespace API_Layer.DataModels
{
    public class RegisterData
    {
        [Required]
        public string firstName { get; set; }
        [Required]
        public string lastName { get; set; }
        [Required]
        public string Email { get; set; }
        [Required]
        public string Password { get; set; }
        [Required]
        public string phone { get; set; }
    }
}
