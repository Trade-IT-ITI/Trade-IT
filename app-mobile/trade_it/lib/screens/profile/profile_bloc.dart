import 'package:bloc/bloc.dart';
import 'package:trade_it/bloc/bloc_state.dart';
import 'package:trade_it/screens/profile/profile_data.dart';

import '../../models/user.dart';

abstract class ProfileEvents {}

//class ProfileLoadingEvent extends ProfileEvents {}
class ProfileGetDataEvent extends ProfileEvents {}

class ProfileBloc extends Bloc<ProfileEvents, BlocState<User>> {
  ProfileBloc(BlocState<User> initialState) : super(BlocState()) {
    on<ProfileGetDataEvent>((event, emit) async {
      emit(BlocState(isLoading: true));
      try {
        User user = await ProfileData().getUser();

        //print(products);
        emit(BlocState(hasData: true, data: user));
      } catch (error) {
        emit(BlocState(hasError: true, error: error.toString()));
        print(error);
      }
    });
  }
}
