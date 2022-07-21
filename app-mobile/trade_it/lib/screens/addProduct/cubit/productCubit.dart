import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_it/handlers/services.dart';
import 'package:trade_it/models/area.dart';
import 'package:trade_it/models/category.dart';
import 'package:trade_it/models/city.dart';
import 'package:trade_it/models/product.dart';
import 'package:trade_it/models/sub_category.dart';
import 'package:trade_it/screens/addProduct/cubit/productStates.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit() : super(AddProductInitialState());

  CommonServices services = CommonServices();

  late List<Category> categories;
  late List<City> cities;

  late Category selectedCategory;
  late SubCategory selectedSubCategory;
  late City selectedCity;
  late Area selectedArea;

  void getCategories() async {
    emit(AddProductLoading());
    try {
      categories = await services.getCategories();
      cities = await services.getCities();
      selectedCategory = categories[0];
      selectedSubCategory = categories[0].subcategories[0];
      selectedCity = cities[0];
      selectedArea = cities[0].areas[0];
      emit(RequiredDataLoaded(categories, cities));
    } catch (error) {
      emit(RequiredDataFailed(error));
    }
  }

  void addProduct(Product product, BuildContext context) async {
    emit(AddProductLoading());
    try {
      String json = await services.addProduct(product);
      var map = jsonDecode(json);
      Product nProduct = Product.fromJson(map);
      emit(AddProductSuccess(nProduct));
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushNamed(context, "/home");
      });
    } catch (error) {
      emit(AddProductFailed(error.toString()));
      Future.delayed(const Duration(seconds: 2), () {
        emit(RequiredDataLoaded(categories, cities));
      });
    }
  }
}
