import 'dart:convert';

import 'package:trade_it/handlers/requests_handler.dart';
import 'package:trade_it/models/user.dart';

RequestHandler reqHandler = RequestHandler();

class HomeData {
  String url = reqHandler.baseURL + "users";
  Future<List<User>> getProducts() async {
    String response = await reqHandler.getData(url);
    Map responseJson = jsonDecode(response);
    Iterable productListJson = responseJson["data"];
    //print("productListJson");
    //print(productListJson);
    List<User> productsList =
        productListJson.map((product) => User.fromJson(product)).toList();
    //print("Products : ");
    //print(productsList);
    return productsList;
  }
  // Future<List<Product>> getProducts() async {
  //   String url = Constants.baseURL + "users";
  // }
}
