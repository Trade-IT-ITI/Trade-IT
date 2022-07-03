namespace API_Layer.QueryParameters

{
    public class QueryParameter
    {
        //searching
        public string? searchText { get; set; }

        //sorting
        public string? orderBy { get; set; }
        public bool? asc { get; set; }

        //paginagtion
        int? _pageNumber;
        public int? pageNumber
        {
            get { return _pageNumber; }
            set { _pageNumber = (value != null && value.Value > 0) ? value : null; }
        }

        int maxCapacity = 50;
        int? _pageCapacity;
        public int? pageCapacity
        {
            get { return _pageCapacity; }
            set
            {
                if (value != null && value.Value > 0)
                {
                    if (value.Value > maxCapacity)
                        _pageCapacity = maxCapacity;
                    else
                        _pageCapacity = value;
                }
                else
                    _pageCapacity = null;
            }
        }

        //expanding related data
        public string[]? expand { get; set; }
    }
}
