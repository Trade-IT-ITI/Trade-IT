import 'package:bloc/bloc.dart';
import 'package:trade_it/bloc/bloc_state.dart';
import 'package:trade_it/models/filter.dart';
import 'package:trade_it/models/product.dart';

import 'search_data.dart';

abstract class SearchEvents {}

//class SearchLoadingEvent extends SearchEvents {}
class SearchGetDataEvent extends SearchEvents {}

class SearchBloc extends Bloc<SearchEvents, BlocState<List<Product>>> {
  SearchBloc(
      {required BlocState<List<Product>> initialState,
      required FilterData filterOBJ})
      : super(BlocState()) {
    on<SearchGetDataEvent>((event, emit) async {
      emit(BlocState(isLoading: true));
      try {
        Map<String, dynamic> query = filterOBJ.toJson();
        List<Product> products = await SearchData().getProducts(
          queryParamsMap: query,
        );

        // print("products bloc :::::::::");
        // print(products);
        emit(BlocState(hasData: true, data: products));
      } catch (error) {
        emit(BlocState(hasError: true, error: error.toString()));
        print(error);
      }
    });
  }
}
