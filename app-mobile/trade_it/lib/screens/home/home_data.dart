import 'dart:convert';

import 'package:trade_it/handlers/requests_handler.dart';
import 'package:trade_it/models/product.dart';

import '../../models/sub_category.dart';

RequestHandler reqHandler = RequestHandler();

class HomeData {
  Future<List<Product>> getProducts() async {
    List<String> query = [
      "City",
      "Owner",
      "Subcategory",
      "ProductImages",
      "Area",
      "Status"
    ];
    String url = reqHandler.createUrlParams(
      endPoint: "Product",
      queryParams: query,
    );
    String response = await reqHandler.getData(url);
    Map responseJson = jsonDecode(response);
    Iterable productListJson = responseJson["products"];
    //print("productListJson");
    //print(productListJson);
    List<Product> productsList =
        productListJson.map((product) => Product.fromJson(product)).toList();
    //  print("Product : ");
    // print(productsList[0].productImages![0]['name']);
    return productsList;
  }

  Future<List<SubCategory>> getSubCategories() async {
    String response =
        await reqHandler.getData(reqHandler.baseURL + "SubCategory");
    //print(response);
    // List responseJson = jsonDecode(response);
    Iterable subCategoryListJson = jsonDecode(response);
    List<SubCategory> subCategoryList = subCategoryListJson
        .map((subCategory) => SubCategory.fromJson(subCategory))
        .toList();
    //print("subCategoryList : ");
    //print(subCategoryList[0].name);
    return subCategoryList;
  }
  // Future<List<Product>> getProducts() async {
  //   String url = Constants.baseURL + "users";
  // }
}
