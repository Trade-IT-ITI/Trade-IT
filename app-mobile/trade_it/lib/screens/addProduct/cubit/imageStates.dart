
import 'dart:io';

abstract class PickingImageStates{}
class AddingProductImage extends PickingImageStates{}

class AddingProductImageFailed extends PickingImageStates{
  final String errorMessage;

  AddingProductImageFailed(this.errorMessage);
}

class AddingProductImageSuccess extends PickingImageStates{
  File image;

  AddingProductImageSuccess(this.image);
}