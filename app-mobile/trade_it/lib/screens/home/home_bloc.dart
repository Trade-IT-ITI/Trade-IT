import 'package:bloc/bloc.dart';
import 'package:trade_it/bloc/bloc_state.dart';
import 'package:trade_it/models/product.dart';

import 'home_data.dart';

abstract class HomeEvents {}

//class HomeLoadingEvent extends HomeEvents {}
class HomeGetDataEvent extends HomeEvents {}

class HomeBloc extends Bloc<HomeEvents, BlocState<List<Product>>> {
  HomeBloc(BlocState<List<Product>> initialState) : super(BlocState()) {
    on<HomeGetDataEvent>((event, emit) async {
      emit(BlocState(isLoading: true));
      try {
        List<Product> products = await HomeData().getProducts();
        //print(products);
        emit(BlocState(hasData: true, data: products));
      } catch (error) {
        emit(BlocState(hasError: true, error: error.toString()));
        print(error);
      }
    });
  }
}
