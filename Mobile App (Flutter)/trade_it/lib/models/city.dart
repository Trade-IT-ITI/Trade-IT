import 'package:trade_it/models/area.dart';
import 'package:trade_it/models/product.dart';



class City {

  late int id;
  late String name;
  late List<Area> areas;
  List<Product>? products;

  City({
   required this.id,
   required this.name,
   required this.areas,
   this.products,
});

  factory City.fromJson(Map<String,dynamic> json){
    City city = City(
      id:json['cityId'],
      name: json['name'],
      areas: List<Area>.from(json['areas'].map((area)=>Area.fromJson(area))),
      products: json['products'] == null ? null : List<Product>.from(json['products'].map((product)=>Product.fromJson(product))),
    );

    return city;
  }
}