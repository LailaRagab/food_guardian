import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:food_guardian/features/inventory_feature/presentation/inventory_view_model/upload_photo_logic.dart';

class OnPressedGalleryAndCameraPicker {
  File? temp;
  FileImage? image;
  FileImage? takedImage;
  set pickedImageSet(File? pickedImage) {
    image = pickedImage != null ? FileImage(pickedImage) : null;
  }

  Future<void> onPressedGalleryPicker() async {
    temp = await UploadPhoto.uploadGalleryPicker();
    if (temp != null) {
      pickedImageSet = temp;
    }
  }

  Future<void> onPressedCameraPicker() async {
    temp = await UploadPhoto.uploadCameraPicker();
    if (temp != null) {
      pickedImageSet = temp;
    }
  }

  void takedImageSet(FileImage? takedImage) {
    takedImage = takedImage;
    print(takedImage);
  }
}
