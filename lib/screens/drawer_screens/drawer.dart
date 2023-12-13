import 'package:Probulon/common/color.dart';
import 'package:Probulon/controller/drawer_controller/drawer_controller.dart';
import 'package:Probulon/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonDrawer extends StatelessWidget {
  CommonDrawer({super.key});

  DrawerCntrl drawerCntrl = Get.put(DrawerCntrl());

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    final height = Get.height;
    final width = Get.width;
    return Drawer(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      child: Column(
        children: [
          Container(
            height: height * 0.6,
            margin: EdgeInsets.only(
                top: height * 0.06, left: width * 0.04, right: width * 0.04),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: isDarkMode ? ColorUtils.appColor : Colors.white,
              boxShadow: [
                BoxShadow(
                  color: isDarkMode
                      ? Colors.transparent
                      : Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0.0, 0.2),
                ),
              ],
            ),
            child: ListView.builder(
              itemCount: 9,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.015),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(drawerCntrl.screens[index]);
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.04),
                            child: Icon(
                              drawerCntrl.drawerIcons[index],
                              size: 25,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                          Text(
                            "${drawerCntrl.drawerItems[index]}".tr,
                            style: textStyleRes.mediumText.copyWith(
                                color: isDarkMode ? Colors.white : Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            height: height * 0.12,
            margin: EdgeInsets.only(
                top: height * 0.05, left: width * 0.04, right: width * 0.04),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color:
                  isDarkMode ? ColorUtils.grey.withOpacity(0.3) : Colors.white,
              boxShadow: [
                BoxShadow(
                  color: isDarkMode ? Colors.transparent : ColorUtils.appColor,
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0.0, 0.2),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                      child: Icon(
                        Icons.logout,
                        size: 25,
                      ),
                    ),
                    Text(
                      "logout".tr,
                      style: textStyleRes.mediumText.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  child: Text(
                    "copyrights".tr,
                    style: textStyleRes.mediumText.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
