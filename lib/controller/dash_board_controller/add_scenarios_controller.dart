import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddScenarios extends GetxController {
  TextEditingController nameCntrl = TextEditingController();
  TextEditingController descCntrl = TextEditingController();
  int select = 0;
  List type = [
    "daily",
    "weekly",
  ];
}
