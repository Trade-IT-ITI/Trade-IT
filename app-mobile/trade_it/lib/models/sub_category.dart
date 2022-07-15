class SubCategory {
  int? subcategoryId;
  String? name;
  var category;
  int? categoryId;
  List? products;

  SubCategory(
      {this.subcategoryId,
      this.name,
      this.category,
      this.categoryId,
      this.products});

  SubCategory.fromJson(Map<String, dynamic> json) {
    subcategoryId = json['subcategoryId'];
    name = json['name'];
    category = json['category'];
    categoryId = json['categoryId'];
    products = json['products'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subcategoryId'] = this.subcategoryId;
    data['name'] = this.name;
    data['category'] = this.category;
    data['categoryId'] = this.categoryId;
    data['products'] = this.products;
    return data;
  }
}
