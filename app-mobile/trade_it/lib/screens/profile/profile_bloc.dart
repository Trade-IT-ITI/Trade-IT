import 'package:bloc/bloc.dart';
import 'package:trade_it/bloc/bloc_state.dart';
import 'package:trade_it/screens/profile/profile_data.dart';

abstract class ProfileEvents {}

//class ProfileLoadingEvent extends ProfileEvents {}
class ProfileGetDataEvent extends ProfileEvents {}

class ProfileBloc extends Bloc<ProfileEvents, BlocState<Map<String, dynamic>>> {
  ProfileBloc(BlocState<Map<String, dynamic>> initialState)
      : super(BlocState()) {
    on<ProfileGetDataEvent>((event, emit) async {
      emit(BlocState(isLoading: true));
      try {
        Map<String, dynamic> profileData = await ProfileData().getProfileData();

        //print(products);
        emit(BlocState(hasData: true, data: profileData));
      } catch (error) {
        emit(BlocState(hasError: true, error: error.toString()));
        print(error);
      }
    });
  }
}
