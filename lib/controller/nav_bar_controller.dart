import 'package:Probulon/screens/home_screen.dart';
import 'package:Probulon/screens/scenarios_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/images.dart';
import '../screens/notification_screen.dart';

class NavBarCntrl extends GetxController {
  int currentIndex = 0;

  List<Widget> pages = [
    Container(color: Colors.green, child: const Center(child: Text('Page 2'))),
    ScenariosScreen(),
    NotificationScreen(),
    HomeScreen(),
  ];

  List title = ["test1".tr, "test2".tr, "evidence".tr, "test".tr];
  List<Widget> actions = [
    Text("test1".tr),
    Text("test2".tr),
    Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.03,
            vertical: Get.height * 0.008,
          ),
          decoration: BoxDecoration(
            color: Colors.red,
            border: Border.all(),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            "armed".tr,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: Get.width * 0.04,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.02,
            vertical: Get.height * 0.004,
          ),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                ImgRes.cloud,
                color: Colors.blue,
              ),
              SizedBox(width: Get.width * 0.02),
              Text(
                "cloud".tr,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.02,
            vertical: Get.height * 0.008,
          ),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            "blocked".tr,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.blue,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: Get.width * 0.04,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.02,
            vertical: Get.height * 0.004,
          ),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                ImgRes.cloud,
                color: Colors.blue,
              ),
              SizedBox(width: Get.width * 0.02),
              Text(
                "cloud".tr,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  ];
}
