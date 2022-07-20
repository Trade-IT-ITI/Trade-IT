import 'package:trade_it/models/sub_category.dart';

class Category {
  late int id;
  late String name;
  late List<SubCategory> subcategories;

  Category({
    required this.id,
    required this.name,
    required this.subcategories
});

  factory Category.fromJson(Map<String,dynamic> json){

    Category cat = Category(
      id: json['categoryId'],
      name: json['name'],
      subcategories: List.from(json['subcategories'].map((subCategory)=> SubCategory.fromJson(subCategory)))
    );
    return cat;
  }

  bool operator ==(dynamic other) =>
      other != null && other is Category && id == other.id;

  @override
  int get hashCode => super.hashCode;
}