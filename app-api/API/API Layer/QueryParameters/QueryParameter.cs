namespace API_Layer.QueryParameters

{
    public class QueryParameter
    {
        //search
        public string? searchText { get; set; }
        
        //sorting
        public string? orderBy { get; set; }
        public bool? asc { get; set; }

        //paginagtion
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

        //expanding related data
        public string[]? expand { get; set; }        
    }
}
