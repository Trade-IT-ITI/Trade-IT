import 'dart:convert';

import 'package:http/http.dart';
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

  Future<int> addProductToFav({required int userId,required int productId})async{
    Map<String,int> body = {
      "userId":userId,
      "productId":productId
    };
    Response response = await reqHandler.post(reqHandler.baseURL+"Favourite", body: body);
    return response.statusCode;
  }

  Future<int> increaseViews(int id)async{
    int statusCode = await reqHandler.increaseViews(id);
    return statusCode;
  }
}
