import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlarmsCntrl extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List<bool> switchValues = List.generate(10, (index) => false);
  List name = [
    'sirena',
    'sensorthe',
    'temrature',
    'sirena',
    'sensorthe',
    'temrature',
    'sirena',
    'sensorthe',
    'temrature',
    'temrature',
  ];
}
