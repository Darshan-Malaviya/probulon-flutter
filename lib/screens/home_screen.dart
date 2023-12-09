import 'package:Probulon/common/color.dart';
import 'package:Probulon/controller/home_screen_controller.dart';
import 'package:Probulon/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/common_button.dart';

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
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: GetBuilder<HomeScreenCntrl>(
        id: 'home',
        builder: (controller) {
          return Column(
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
                            color: isDarkMode ? Colors.white : Colors.black),
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
                            color: isDarkMode ? Colors.white : Colors.black),
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
                            color: isDarkMode ? Colors.white : Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
