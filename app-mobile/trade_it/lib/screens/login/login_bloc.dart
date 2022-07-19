import 'package:bloc/bloc.dart';
import 'package:trade_it/bloc/bloc_state.dart';
import 'package:trade_it/models/product.dart';

import '../../models/sub_category.dart';
import 'login_data.dart';

abstract class LoginEvents {}

//class LoginLoadingEvent extends LoginEvents {}
class LoginGetDataEvent extends LoginEvents {}

class LoginBloc extends Bloc<LoginEvents, BlocState<List<List>>> {
  LoginBloc(BlocState<List<List>> initialState) : super(BlocState()) {
    on<LoginGetDataEvent>((event, emit) async {
      emit(BlocState(isLoading: true));
      try {
        List<Product> products = await LoginData().getProducts();
        List<SubCategory> subCategories = await LoginData().getSubCategories();
        //print(products);
        emit(BlocState(hasData: true, data: [products, subCategories]));
      } catch (error) {
        emit(BlocState(hasError: true, error: error.toString()));
        print(error);
      }
    });
  }
}
