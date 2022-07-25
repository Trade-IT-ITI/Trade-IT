class DetailsProduct {
  int? productId;
  String? title;
  String? descrioption;
  String? city;
  String? area;
  String? status;
  String? category;
  String? subcategory;
  String? postDateTime;
  double? price;
  int? requestCount;
  int? viewsCount;
  String? ownerFullName;
  String? ownerPhoneNumber;
  List<String>? instructions;
  List<String>? productImages;

  DetailsProduct(
      {this.productId,
      this.title,
      this.descrioption,
      this.city,
      this.area,
      this.status,
      this.category,
      this.subcategory,
      this.postDateTime,
      this.price,
      this.requestCount,
      this.viewsCount,
      this.ownerFullName,
      this.ownerPhoneNumber,
      this.instructions,
      this.productImages});

  DetailsProduct.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    title = json['title'];
    descrioption = json['descrioption'];
    city = json['city'];
    area = json['area'];
    status = json['status'];
    category = json['category'];
    subcategory = json['subcategory'];
    postDateTime = json['postDateTime'];
    price = json['price'];
    requestCount = json['requestCount'];
    viewsCount = json['viewsCount'];
    ownerFullName = json['ownerFullName'];
    ownerPhoneNumber = json['ownerPhoneNumber'];
    instructions = json['instructions'].cast<String>();
    productImages = json['productImages'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['title'] = this.title;
    data['descrioption'] = this.descrioption;
    data['city'] = this.city;
    data['area'] = this.area;
    data['status'] = this.status;
    data['category'] = this.category;
    data['subcategory'] = this.subcategory;
    data['postDateTime'] = this.postDateTime;
    data['price'] = this.price;
    data['requestCount'] = this.requestCount;
    data['viewsCount'] = this.viewsCount;
    data['ownerFullName'] = this.ownerFullName;
    data['ownerPhoneNumber'] = this.ownerPhoneNumber;
    data['instructions'] = this.instructions;
    data['productImages'] = this.productImages;
    return data;
  }
}
