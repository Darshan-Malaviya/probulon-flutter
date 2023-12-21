import 'package:Probulon/screens/dash_board/users_screen.dart';
import 'package:Probulon/screens/drawer_screens/devices_screen.dart';
import 'package:Probulon/screens/drawer_screens/facilities_screen.dart';
import 'package:Probulon/screens/drawer_screens/profile_screen.dart';
import 'package:Probulon/screens/drawer_screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerCntrl extends GetxController {
  List screens = [
    ProfileScreen(),
    ProfileScreen(),
    UsersScreen(),
    DevicesScreen(),
    FacilitiesScreen(),
    ProfileScreen(),
    ProfileScreen(),
    SettingScreen(),
    ProfileScreen(),
  ];
  List drawerItems = [
    "myprofile",
    "statusReview",
    "users",
    "actions",
    "myfacilities",
    "facilities",
    "notificationhistory",
    "settings",
    "help",
  ];
  List drawerIcons = [
    Icons.person_outline,
    Icons.check_circle_outline,
    Icons.group_outlined,
    Icons.timer_outlined,
    Icons.home_work_outlined,
    Icons.home_work_outlined,
    Icons.history,
    Icons.settings_outlined,
    Icons.help_outline,
  ];
}
