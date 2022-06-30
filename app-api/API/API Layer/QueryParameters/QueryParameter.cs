namespace API_Layer.QueryParameters

{
    public class QueryParameter
    {
        public string[]? expand { get; set; }
        public string? orderBy { get; set; }
        public string? orderType { get; set; }

        private int? _pageNumber;
        public int? pageNumber
        {
            get { return _pageNumber; }
            set
            {
                _pageNumber = (value != null && value.Value > 0) ? value : null;
            }
        }

        private int? _pageCapacity;
        public int? pageCapacity
        {
            get { return _pageCapacity; }
            set
            {
                _pageCapacity = (value != null && value.Value > 0) ? value : null;
            }
        }

    }
}
