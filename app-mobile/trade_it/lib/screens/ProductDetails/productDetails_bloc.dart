import 'package:bloc/bloc.dart';
import 'package:trade_it/bloc/bloc_state.dart';
import 'package:trade_it/screens/ProductDetails/productDetails_data.dart';

import '../../models/details_product.dart';

abstract class ProductDetailsEvents {}

class ProductDetailsGetDataEvent extends ProductDetailsEvents {}

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvents, BlocState<DetailsProduct>> {
  ProductDetailsBloc(
      {required BlocState<DetailsProduct> initialState, required int id})
      : super(BlocState()) {
    on<ProductDetailsGetDataEvent>((event, emit) async {
      emit(BlocState(isLoading: true));
      try {
        DetailsProduct productOBJ =
            await ProductDetailsData().getProduct(productID: id);
        emit(BlocState(hasData: true, data: productOBJ));
      } catch (error) {
        emit(BlocState(hasError: true, error: error.toString()));
        print(error);
      }
    });
  }
}
