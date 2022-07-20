
import 'package:trade_it/models/category.dart';
import 'package:trade_it/models/city.dart';
import 'package:trade_it/models/product.dart';

abstract class AddProductState{}

class AddProductInitialState extends AddProductState{}

class RequiredDataLoaded extends AddProductState{
  final List<Category> categories;
  final List<City> cities;
  RequiredDataLoaded(this.categories,this.cities);

}

class RequiredDataFailed extends AddProductState{
  final Object error;

  RequiredDataFailed(this.error);
}



class AddProductLoading extends AddProductState{}

class AddProductSuccess extends AddProductState{
  final Product product;

  AddProductSuccess(this.product);
}

class AddProductFailed extends AddProductState{
  final Error error;

  AddProductFailed(this.error);
}



