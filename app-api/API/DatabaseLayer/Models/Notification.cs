namespace DatabaseLayer.Models
{
    public class Notification
    {
        public int NotificationId { get; set; }
        public string Title { get; set; }
        public string Body { get; set; }
        public DateTime DateTime { get; set; }

        public Product Product { get; set; }
        public int ProductId { get; set; }
    }
}
