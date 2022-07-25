import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:trade_it/models/product.dart';

class User {
  int? userId;
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? phone;
  int? type;
  List? favourites;
  List? products;

  User(
      {this.userId,
      this.email,
      this.password,
      this.firstName,
      this.lastName,
      this.phone,
      this.type,
      this.favourites,
      this.products});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    email = json['email'];
    password = json['password'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'];
    type = json['type'];
    favourites = json['favourites'];
    products = json['products'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['email'] = this.email;
    data['password'] = this.password;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phone'] = this.phone;
    data['type'] = this.type;
    data['favourites'] = this.favourites;
    data['products'] = this.products;
    return data;
  }
}

storeUser({required User user}) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString("user", jsonEncode(user));
}

Future<User> getUser() async {
  final prefs = await SharedPreferences.getInstance();
  final String? stringUser = prefs.getString("user");
  var userObjString = jsonDecode(stringUser.toString());
  User user = User.fromJson(userObjString);
  // print(user);
  return user;
}

removeUser() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove("user");
}

Future<bool> checkUser() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.containsKey("user");
}

void setFirstUse() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('first', false);
}

Future<bool> checkFirstUse() async {
  final prefs = await SharedPreferences.getInstance();
  bool? check = await prefs.containsKey('first');
  return check;
}

Future<bool?> getFirstUse() async {
  final prefs = await SharedPreferences.getInstance();
  bool? firstUse = prefs.getBool('first');
  return firstUse;
}

List<Product> toProductList(
    {required List<dynamic> objProductList, bool isFav = false}) {
  List<Product> productList = [];
  if (isFav) {
    for (int i = 0; i < objProductList.length; i++) {
      print(objProductList);
      Product prd = Product.fromJson(objProductList[i]["product"]);
      productList.add(prd);
    }
  } else {
    for (int i = 0; i < objProductList.length; i++) {
      Product prd = Product.fromJson(objProductList[i]);
      productList.add(prd);
    }
  }
  return productList;
}
