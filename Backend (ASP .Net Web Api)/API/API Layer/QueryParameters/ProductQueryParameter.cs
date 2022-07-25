namespace API_Layer.QueryParameters
{
    public class ProductQueryParameter : QueryParameter
    {
        //fitlering
        int? _maxPrice;
        public int? maxPrice
        {
            get { return _maxPrice; }
            set { _maxPrice = (value > 0) ? value : null; }
        }

        int? _minPrice;
        public int? minPrice
        {
            get { return _minPrice; }
            set { _minPrice = (value > 0) ? value : null; }
        }

        int? _city;
        public int? city
        {
            get { return _city; }
            set { _city = (value > 0) ? value : null; }
        }

        int? _area;
        public int? area
        {
            get { return _area; }
            set { _area = (value > 0) ? value : null; }
        }

        int? _category;
        public int? category
        {
            get { return _category; }
            set { _category = (value > 0) ? value : null; }
        }

        int? _subcategory;
        public int? subcategory
        {
            get { return _subcategory; }
            set { _subcategory = (value > 0) ? value : null; }
        }

        int? _status;
        public int? status
        {
            get { return _status; }
            set { _status = (value > 0) ? value : null; }
        }
    }
}
