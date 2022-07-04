import 'package:bloc/bloc.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeDataState extends HomeStates {}

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());
}
