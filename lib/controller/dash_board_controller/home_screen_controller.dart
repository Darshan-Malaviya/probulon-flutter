import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenCntrl extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool isIconChanges = false;
  int index = 0;
  List name = [
    // 'aux'.tr,
    // 'stall'.tr,
    "Manual",
    "Auto"
  ];
}
