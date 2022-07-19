import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trade_it/handlers/services.dart';
import 'package:trade_it/models/area.dart';
import 'package:trade_it/models/category.dart';
import 'package:trade_it/models/city.dart';
import 'package:trade_it/models/product.dart';
import 'package:trade_it/models/sub_category.dart';
import 'package:trade_it/screens/addProduct/cubit/productStates.dart';

class AddProductCubit extends Cubit<AddProductState>{
  AddProductCubit() : super(AddProductInitialState());

  CommonServices services = CommonServices();

  late Category selectedCategory;
  late SubCategory selectedSubCategory;
  late City selectedCity;
  late Area selectedArea;

  void getCategories() async{
    emit(AddProductLoading());
    try{
      List<Category> categories = await services.getCategories();
      List<City> cities = await services.getCities();
      selectedCategory = categories[0];
      selectedSubCategory = categories[0].subcategories[0];

      selectedCity = cities[0];
      selectedArea = cities[0].areas[0];
      emit(RequiredDataLoaded(categories,cities));
    } catch (error){
      emit(RequiredDataFailed(error));
    }
  }

  void addProduct(Product product)async{
      emit(AddProductLoading());
      try{
        Product nProduct = await services.addProduct(product);
        emit(AddProductSuccess(nProduct));
      } catch (error){
        emit(AddProductFailed(error));
      }
  }






}