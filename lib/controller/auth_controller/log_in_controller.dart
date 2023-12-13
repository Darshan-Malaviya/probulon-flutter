import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SigninCntrl extends GetxController {
  bool obsecure = false;
  final formKey = GlobalKey<FormState>();
  TextEditingController emailcntrl = TextEditingController();
  TextEditingController passcntrl = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
