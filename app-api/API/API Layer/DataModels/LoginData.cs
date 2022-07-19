using DatabaseLayer.Helper;

namespace API_Layer.DataModels
{
    public class LoginData
    {
        public string Email { get; set; }
        public string Password { get; set; }
        public UserType Type { get; set; }
    }
}
