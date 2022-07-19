import 'dart:convert';

import 'package:trade_it/handlers/requests_handler.dart';

import '../../models/details_product.dart';

RequestHandler reqHandler = RequestHandler();

class ProductDetailsData {
  Future<DetailsProduct> getProduct({required int productID}) async {
    String url = reqHandler.baseURL + "Product/$productID";
    String response = await reqHandler.getData(url);
    DetailsProduct product = DetailsProduct.fromJson(jsonDecode(response));
    //print(product.title);
    return product;
  }
}
