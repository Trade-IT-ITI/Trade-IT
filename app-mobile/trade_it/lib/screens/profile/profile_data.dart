import 'package:trade_it/handlers/requests_handler.dart';

import '../../models/user.dart';

RequestHandler reqHandler = RequestHandler();

class ProfileData {
  Future<User> getUser() async {
    // List<String> query = [
    //   "City",
    //   "Owner",
    //   "Subcategory",
    //   "ProductImages",
    //   "Area",
    //   "Status"
    // ];
    // String url = reqHandler.createUrlParams(
    //   fullUrl: reqHandler.baseURL + "Product",
    //   queryParams: query,
    // );
    // String response = await reqHandler.getData(url);
    // Map responseJson = jsonDecode(response);
    // Iterable productListJson = responseJson["products"];
    // //print("productListJson");
    // //print(productListJson);
    // List<Product> productsList =
    //     productListJson.map((product) => Product.fromJson(product)).toList();
    //  print("Product : ");
    // print(productsList[0].productImages![0]['name']);
    return User();
  }
}
