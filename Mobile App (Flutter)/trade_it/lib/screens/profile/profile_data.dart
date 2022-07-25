import 'package:trade_it/handlers/requests_handler.dart';
import 'package:trade_it/models/product.dart';

import '../../models/user.dart';

RequestHandler reqHandler = RequestHandler();

class ProfileData {
  Future<Map<String, dynamic>> getProfileData() async {
    User loggedUser = await getUser();
    List<Product> userProducts =
        toProductList(objProductList: loggedUser.products!);
    List<Product> userFavProducts =
        toProductList(objProductList: loggedUser.favourites!, isFav: true);

    print("loggedUser");
    print(loggedUser);
    print("userProducts");
    print(userProducts);
    print("userFavProducts");
    print(userFavProducts);

    final Map<String, dynamic> data = Map<String, dynamic>();

    data["loggedUser"] = loggedUser;
    data["userFavProducts"] = userFavProducts;
    data["userProducts"] = userProducts;

    return data;
  }
}
