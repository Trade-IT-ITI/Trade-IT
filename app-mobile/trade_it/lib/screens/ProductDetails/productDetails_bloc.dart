import 'package:bloc/bloc.dart';
import 'package:trade_it/bloc/bloc_state.dart';
import 'package:trade_it/screens/ProductDetails/productDetails_data.dart';

import '../../models/details_product.dart';
import '../../models/user.dart';

abstract class ProductDetailsEvents {}

class ProductDetailsGetDataEvent extends ProductDetailsEvents {}

class AddProductToFavEvent extends ProductDetailsEvents{}

class ProductDetailsBloc extends Bloc<ProductDetailsEvents, BlocState<DetailsProduct>> {

  late DetailsProduct productOBJ;
  ProductDetailsBloc(
      {required BlocState<DetailsProduct> initialState, required int id})
      : super(BlocState()) {
    on<ProductDetailsGetDataEvent>((event, emit) async {
      emit(BlocState(isLoading: true));
      User user = await getUser();
      print(user.firstName);
      bool isFav = user.favourites?.contains(id)??false;
      print("IS Favourite?: "+ isFav.toString());
      try {
        productOBJ = await ProductDetailsData().getProduct(productID: id);
        emit(BlocState(hasData: true, data: productOBJ,isFav: isFav));
      } catch (error) {
        emit(BlocState(hasError: true, error: error.toString()));
        print(error);
      }
    });

    on<AddProductToFavEvent>((event,emit)async{
      try{
        User user = await getUser();
        print(user.userId);
        bool isFav = await ProductDetailsData().addProductToFav(userId: user.userId!, productId: id);
        user.favourites?.add(id);
        await storeUser(user: user);
        emit(BlocState(hasData: true, data: productOBJ,isFav: isFav));
      } catch(error){
        print(error);
        emit(BlocState(hasError: true, error: error.toString()));
      }
    });
  }
}
