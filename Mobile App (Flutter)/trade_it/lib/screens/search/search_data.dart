import 'dart:convert';

import 'package:trade_it/handlers/requests_handler.dart';

import '../../models/product.dart';

RequestHandler reqHandler = RequestHandler();

class SearchData {
  Future<List<Product>> getProducts(
      {required Map<String, dynamic> queryParamsMap}) async {
    // print("queryParams");
    // print(queryParams);
    var urlWithParams = Uri.parse(reqHandler.baseURL + "Product")
        .resolveUri(Uri(queryParameters: queryParamsMap));
    String stringUrlWithParams = urlWithParams.toString();
    List<String> query = [
      "City",
      "Owner",
      "Subcategory",
      "ProductImages",
      "Area",
      "Status"
    ];
    String url = reqHandler.createUrlParams(
      fullUrl: stringUrlWithParams,
      queryParams: query,
      inFilter: true,
    );
    // print("search url");
    // print(url);
    String response = await reqHandler.getData(url);
    Map responseJson = jsonDecode(response);
    Iterable productListJson = responseJson["products"];
    // print("productListJson");
    // print(productListJson);
    List<Product> productsList =
        productListJson.map((product) => Product.fromJson(product)).toList();
    //  print("Product : ");
    // print(productsList[0].productImages![0]['name']);
    return productsList;
  }
}
