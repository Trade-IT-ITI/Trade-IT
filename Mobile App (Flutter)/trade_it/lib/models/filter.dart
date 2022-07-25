class FilterData {
  int? area;
  int? category;
  int? city;
  String? searchText;
  int? status;
  int? subcategory;
  int? maxPrice;
  int? minPrice;
  bool? isSearch;
  bool? isSubcategory;

  FilterData({
    this.area = -1,
    this.category = -1,
    this.city = -1,
    this.searchText = "",
    this.status = -1,
    this.subcategory = -1,
    this.maxPrice = -1,
    this.minPrice = -1,
    this.isSearch = true,
    this.isSubcategory = false,
  });

  FilterData.fromJson(Map<String, dynamic> json) {
    area = json['area'];
    category = json['category'];
    city = json['city'];
    searchText = json['searchText'];
    status = json['status'];
    subcategory = json['subcategory'];
    maxPrice = json['maxPrice'];
    minPrice = json['minPrice'];
    isSearch = json['isSearch'];
    isSubcategory = json['isSubcategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['area'] = this.area.toString();
    data['category'] = this.category.toString();
    data['city'] = this.city.toString();
    data['searchText'] = this.searchText.toString();
    data['status'] = this.status.toString();
    data['subcategory'] = this.subcategory.toString();
    data['maxPrice'] = this.maxPrice.toString();
    data['minPrice'] = this.minPrice.toString();
    // data['isSearch'] = this.isSearch;
    // data['isSubcategory'] = this.isSubcategory;
    // print("TO JSON FILTER");
    // print(data);
    return data;
  }
}
