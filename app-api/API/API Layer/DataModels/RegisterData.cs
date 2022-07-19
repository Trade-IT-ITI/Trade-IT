using DatabaseLayer.Helper;

namespace API_Layer.DataModels
{
    public class RegisterData
    {
        public string firstName { get; set; }
        public string lastName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string phone { get; set; }
    }
}
