class Product {
  int? productId;
  String? title;
  String? descrioption;
  String? postDateTime;
  double? price;
  int? requestCount;
  int? viewsCount;
  var notifications;
  var favourites;
  List? productImages;
  var city;
  int? cityId;
  var area;
  int? areaId;
  var status;
  int? statusId;
  var subcategory;
  int? subcategoryId;
  var owner;
  int? userId;

  Product({
    this.productId,
    this.title,
    this.descrioption,
    this.postDateTime,
    this.price,
    this.requestCount,
    this.viewsCount,
    this.notifications,
    this.favourites,
    this.productImages,
    this.city,
    this.cityId,
    this.area,
    this.areaId,
    this.status,
    this.statusId,
    this.subcategory,
    this.subcategoryId,
    this.owner,
    this.userId,
  });

  Product.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    title = json['title'];
    descrioption = json['descrioption'];
    postDateTime = json['postDateTime'];
    price = json['price'];
    requestCount = json['requestCount'];
    viewsCount = json['viewsCount'];
    notifications = json['notifications'];
    favourites = json['favourites'];
    productImages = json['productImages'];
    city = json['city'];
    cityId = json['cityId'];
    area = json['area'];
    areaId = json['areaId'];
    status = json['status'];
    statusId = json['statusId'];
    subcategory = json['subcategory'];
    subcategoryId = json['subcategoryId'];
    owner = json['owner'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['title'] = this.title;
    data['descrioption'] = this.descrioption;
    data['postDateTime'] = this.postDateTime;
    data['price'] = this.price;
    data['requestCount'] = this.requestCount;
    data['viewsCount'] = this.viewsCount;
    data['notifications'] = this.notifications;
    data['favourites'] = this.favourites;
    data['productImages'] = this.productImages;
    data['city'] = this.city;
    data['cityId'] = this.cityId;
    data['area'] = this.area;
    data['areaId'] = this.areaId;
    data['status'] = this.status;
    data['statusId'] = this.statusId;
    data['subcategory'] = this.subcategory;
    data['subcategoryId'] = this.subcategoryId;
    data['owner'] = this.owner;
    data['userId'] = this.userId;
    return data;
  }
}
