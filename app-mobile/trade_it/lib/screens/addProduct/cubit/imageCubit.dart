

import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trade_it/screens/addProduct/cubit/imageStates.dart';

class PickingImageCubit extends Cubit<PickingImageStates>{
  PickingImageCubit() : super(AddingProductImage());



  void addProductImage(ImageSource imageSource)async{
    try{
      emit(AddingProductImage());
      final image = await ImagePicker().pickImage(source: imageSource);
      if(image == null){
        emit(AddingProductImageFailed("Choose an image"));
        return null;
      }
      final pickedImageFile = File(image.path);
      emit(AddingProductImageSuccess(pickedImageFile));

    } on PlatformException catch(error){
      emit(AddingProductImageFailed(error.message!));
    }
  }
}