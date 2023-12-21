import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingCntrl extends GetxController {
  List<bool> switchValues = List.generate(10, (index) => false);
  List icon = [
    Icons.network_ping,
    Icons.alarm,
    Icons.self_improvement,
    Icons.power_off,
  ];
  List funcName = [
    "networkfunctions",
    "devicealarm",
    "sleepinstallation",
    "turnoffallnotifications"
  ];
}
