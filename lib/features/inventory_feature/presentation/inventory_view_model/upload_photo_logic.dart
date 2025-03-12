import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class UploadPhoto {
  static Future<File?> uploadCameraPicker() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      return File(image.path);
    }
    return null;
  }

  static Future<File?> uploadGalleryPicker() async {
    PermissionStatus status;
    if (Platform.isAndroid) {
      final andriodInfo = await DeviceInfoPlugin().androidInfo;
      if (andriodInfo.version.sdkInt <= 32) {
        status = await Permission.storage.request();
      }
      status = await Permission.phone.request();
    } else {
      status = await Permission.phone.request();
    }
    if (status.isGranted) {
      var image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        return File(image.path);
      }
    }
  }
}
