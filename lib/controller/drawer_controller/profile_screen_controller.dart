import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileCntrl extends GetxController {
  /// email controller

  TextEditingController firstemailcntrl = TextEditingController();
  TextEditingController secondemailcntrl = TextEditingController();
  TextEditingController thirdemailcntrl = TextEditingController();
  bool themeMode = false;
  File? image;
  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: source);

    if (pickedImage != null) {
      image = File(pickedImage.path);
      update(['profilescreen']);
    }
    update(['profilescreen']);
    Get.back();
  }
}
