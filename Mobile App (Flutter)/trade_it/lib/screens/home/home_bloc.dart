import 'package:bloc/bloc.dart';
import 'package:trade_it/bloc/bloc_state.dart';
import 'package:trade_it/models/product.dart';

import '../../models/sub_category.dart';
import 'home_data.dart';

abstract class HomeEvents {}

//class HomeLoadingEvent extends HomeEvents {}
class HomeGetDataEvent extends HomeEvents {}

class HomeBloc extends Bloc<HomeEvents, BlocState<List<List>>> {
  HomeBloc(BlocState<List<List>> initialState) : super(BlocState()) {
    on<HomeGetDataEvent>((event, emit) async {
      emit(BlocState(isLoading: true));
      try {
        List<Product> products = await HomeData().getProducts();
        List<SubCategory> subCategories = await HomeData().getSubCategories();
        //print(products);
        emit(BlocState(hasData: true, data: [products, subCategories]));
      } catch (error) {
        emit(BlocState(hasError: true, error: error.toString()));
        print(error);
      }
    });
  }
}
