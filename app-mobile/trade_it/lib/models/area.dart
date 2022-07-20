import 'package:trade_it/models/product.dart';

class Area{
  late int id;
  late String name;
  List<Product>? products;

  Area({
    required this.id,
    required this.name,
    this.products
  });

  factory Area.fromJson(Map<String,dynamic> json){
    Area area = Area(
      id: json['areaId'],
      name: json['name'],
      products: json['product'] == null ? null : List<Product>.from(json['products'].map((product)=>Product.fromJson(product))),
    );

    return area;
  }
}