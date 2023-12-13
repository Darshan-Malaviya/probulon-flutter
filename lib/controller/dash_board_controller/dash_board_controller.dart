import 'package:Probulon/screens/dash_board/alarms_screen.dart';
import 'package:Probulon/screens/dash_board/home_screen.dart';
import 'package:Probulon/screens/dash_board/notification_screen.dart';
import 'package:Probulon/screens/dash_board/scenarios_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBarCntrl extends GetxController {
  int currentIndex = 3;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<Widget> pages = [
    AlarmsScreen(),
    ScenariosScreen(),
    NotificationScreen(),
    HomeScreen(),
  ];
}
