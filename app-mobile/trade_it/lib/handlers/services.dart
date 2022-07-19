import 'dart:convert';

import 'package:trade_it/handlers/requests_handler.dart';
import 'package:trade_it/models/category.dart';
import 'package:trade_it/models/city.dart';
import 'package:trade_it/models/product.dart';

class CommonServices {


  RequestHandler reqHandler = RequestHandler();

  get l => null;

  Future<List<Category>> getCategories() async {
    String response =
    await reqHandler.getData(reqHandler.createUrlParams(endPoint: "Category", queryParams: ["Subcategories"]));
    //print(response);
    Iterable categoriesJson = jsonDecode(response);
    List<Category> categories = categoriesJson
        .map((category) => Category.fromJson(category))
        .toList();
    return categories;
  }

  Future<List<City>> getCities() async{
    String response = await reqHandler.getData(reqHandler.createUrlParams(endPoint: "City", queryParams: ["Areas"]));
    Iterable jsonData = jsonDecode(response);
    List<City> cities = jsonData.map((city) => City.fromJson(city)).toList();
    return cities;
  }

  Future<Product> addProduct(Product product)async{
    String response = await reqHandler.post(reqHandler.baseURL+"/Product",body: product.toJson());
    var productJson = jsonDecode(response);
    return Product.fromJson(productJson);
  }

}