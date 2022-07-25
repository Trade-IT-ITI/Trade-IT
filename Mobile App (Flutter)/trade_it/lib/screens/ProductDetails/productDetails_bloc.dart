import 'package:bloc/bloc.dart';
import 'package:trade_it/bloc/bloc_state.dart';
import 'package:trade_it/models/product.dart';
import 'package:trade_it/screens/ProductDetails/productDetails_data.dart';

import '../../models/details_product.dart';
import '../../models/user.dart';

abstract class ProductDetailsEvents {}

class ProductDetailsGetDataEvent extends ProductDetailsEvents {}

class AddProductToFavEvent extends ProductDetailsEvents{}

class IncreaseViews extends ProductDetailsEvents{}

class ProductDetailsBloc extends Bloc<ProductDetailsEvents, BlocState<DetailsProduct>> {

  late DetailsProduct productOBJ;
  ProductDetailsBloc(
      {required BlocState<DetailsProduct> initialState, required Product product})
      : super(BlocState()) {
    on<ProductDetailsGetDataEvent>((event, emit) async {
      emit(BlocState(isLoading: true));
      try {
        User user = await getUser();
        List<Product> favourites = toProductList(objProductList: user.favourites!,isFav: true);
        print(user.firstName);
        productOBJ = await ProductDetailsData().getProduct(productID: product.productId!);
        bool isFav = favourites.contains(product);
        print("IS Favourite?: "+ isFav.toString());
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

        user.favourites = toProductList(objProductList: user.favourites!,isFav: true);
        int statusCode = await ProductDetailsData().addProductToFav(userId: user.userId!, productId: product.productId!);
        if(statusCode == 201){
          user.favourites?.add(product);
          //await storeUser(user: user);
          emit(BlocState(hasData: true, data: productOBJ,isFav: true));
        }
        else{
          user.favourites?.remove(product);
          await storeUser(user: user);
          emit(BlocState(hasData: true, data: productOBJ,isFav: false));
        }


      } catch(error){
        print(error);
        emit(BlocState(hasError: true, error: error.toString()));
      }
    });

    on<IncreaseViews>((event,emit) async{
      User user = await getUser();
      if(user.userId != product.userId){
        int statusCode = await ProductDetailsData().increaseViews(product.productId!);
        if(statusCode == 200){
          ProductDetailsBloc productDetailsBloc = ProductDetailsBloc(
            initialState: BlocState(),
            product: product,
          );
          productDetailsBloc.add(ProductDetailsGetDataEvent());
        }
      }
    });
  }
}
