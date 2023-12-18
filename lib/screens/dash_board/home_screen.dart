import 'package:Probulon/common/color.dart';
import 'package:Probulon/common/images.dart';
import 'package:Probulon/controller/dash_board_controller/home_screen_controller.dart';
import 'package:Probulon/screens/drawer_screens/drawer.dart';
import 'package:Probulon/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/common_button.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  HomeScreenCntrl homeScreenCntrl = Get.put(HomeScreenCntrl());

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    final height = Get.height;
    final width = Get.width;
    return Scaffold(
      key: homeScreenCntrl.scaffoldKey,
      appBar: AppBar(
        toolbarHeight: height * 0.075,
        title: Text(
          "test".tr,
          style: textStyleRes.mediumText.copyWith(fontWeight: FontWeight.w500),
        ),
        elevation: 0,
        actions: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.02,
                  vertical: Get.height * 0.008,
                ),
                decoration: BoxDecoration(
                  color: ColorUtils.appColor,
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
                  color: ColorUtils.appColor,
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
        ],
      ),
      drawer: CommonDrawer(),
      body: GetBuilder<HomeScreenCntrl>(
        id: 'home',
        builder: (controller) {
          return SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CommonButton(
                      onTap: () {},
                      height: height * 0.09,
                      width: width * 0.45,
                      decoratioin: BoxDecoration(
                          color: ColorUtils.appColor,
                          borderRadius: BorderRadius.circular(40)),
                      child: Center(
                        child: Text(
                          "partial".tr,
                          style: textStyleRes.mediumText.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    CommonButton(
                      onTap: () {},
                      height: height * 0.09,
                      width: width * 0.45,
                      decoratioin: BoxDecoration(
                          color: ColorUtils.appColor,
                          borderRadius: BorderRadius.circular(40)),
                      child: Center(
                        child: Text(
                          "youare".tr,
                          style: textStyleRes.mediumText.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.05),
                GestureDetector(
                  onTap: () {
                    homeScreenCntrl.isIconChanges =
                        !homeScreenCntrl.isIconChanges;
                    controller.update(['home']);
                  },
                  child: CircleAvatar(
                    maxRadius: width * 0.3,
                    backgroundColor:
                        isDarkMode ? Colors.white : ColorUtils.appColor,
                    child: CircleAvatar(
                      maxRadius: width * 0.25,
                      backgroundColor: homeScreenCntrl.isIconChanges
                          ? Colors.red
                          : Colors.green,
                      child: Icon(
                        homeScreenCntrl.isIconChanges
                            ? Icons.lock_open
                            : Icons.lock,
                        size: 80,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    2,
                    (index) => CommonButton(
                      onTap: () {
                        homeScreenCntrl.index = index;
                        controller.update(['home']);
                      },
                      height: height * 0.09,
                      width: width * 0.45,
                      decoratioin: BoxDecoration(
                          color: homeScreenCntrl.index == index
                              ? Colors.red
                              : Colors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(40)),
                      child: Center(
                        child: Text(
                          homeScreenCntrl.name[index],
                          style: textStyleRes.mediumText.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
