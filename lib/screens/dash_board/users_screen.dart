import 'package:Probulon/common/color.dart';
import 'package:Probulon/controller/drawer_controller/users_controller.dart';
import 'package:Probulon/screens/drawer_screens/drawer.dart';
import 'package:Probulon/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersScreen extends StatelessWidget {
  UsersScreen({super.key});

  UserCntrl userCntrl = Get.put(UserCntrl());

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    final height = Get.height;
    final width = Get.width;
    return GetBuilder<UserCntrl>(
      id: 'users',
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: height * 0.075,
            title: Text(
              "test".tr,
              style: TextStyle(),
            ),
            elevation: 0,
            actions: [
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: width * 0.03, vertical: height * 0.02),
                padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.03,
                  vertical: Get.height * 0.008,
                ),
                decoration: BoxDecoration(
                  color: isDarkMode
                      ? ColorUtils.appColor
                      : Colors.teal.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    "disarmed".tr,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: width * 0.04),
                child: Icon(
                  Icons.bluetooth_disabled,
                ),
              ),
            ],
          ),
          drawer: CommonDrawer(),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: GetBuilder<UserCntrl>(
              id: 'users',
              builder: (controller) {
                return Column(
                  children: [
                    SizedBox(height: height * 0.02),
                    Container(
                      height: height * 0.1,
                      width: width,
                      decoration: BoxDecoration(
                        color: isDarkMode
                            ? ColorUtils.grey.withOpacity(0.3)
                            : Colors.teal,
                        gradient: LinearGradient(
                            colors: isDarkMode
                                ? [
                                    ColorUtils.grey,
                                    ColorUtils.grey,
                                  ]
                                : [
                                    Colors.tealAccent,
                                    Colors.teal,
                                  ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight),
                        boxShadow: [
                          BoxShadow(
                            color:
                                isDarkMode ? Colors.transparent : Colors.grey,
                            spreadRadius: 0.5,
                            blurRadius: 1,
                            offset: Offset(0, 1),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "users".tr,
                                style: textStyleRes.mediumText.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: height * 0.005),
                              Text(
                                "createUser".tr,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: textStyleRes.mediumText.copyWith(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.add,
                            size: 25,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                      itemCount: 10,
                      padding: EdgeInsets.symmetric(vertical: height * 0.01),
                      itemBuilder: (context, index) {
                        return Container(
                          height: height * 0.07,
                          margin: EdgeInsets.symmetric(
                              horizontal: width * 0.01,
                              vertical: height * 0.01),
                          decoration: BoxDecoration(
                            color: isDarkMode
                                ? ColorUtils.grey.withOpacity(0.3)
                                : Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: isDarkMode
                                    ? Colors.transparent
                                    : Colors.grey,
                                spreadRadius: 0.5,
                                blurRadius: 1,
                                offset: Offset(0, 1),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.04),
                                child: Transform.scale(
                                  scale: 1.3,
                                  child: Switch(
                                    inactiveTrackColor: isDarkMode
                                        ? Colors.white.withOpacity(0.5)
                                        : Colors.grey,
                                    activeTrackColor:
                                        Colors.blue.withOpacity(0.8),
                                    inactiveThumbColor: Colors.grey.shade50,
                                    activeColor: Colors.white,
                                    value: userCntrl.switchValues[index],
                                    onChanged: (value) {
                                      userCntrl.switchValues[index] = value;
                                      controller.update(['users']);
                                    },
                                  ),
                                ),
                              ),
                              Text(
                                "evidence".tr,
                                style: textStyleRes.mediumText.copyWith(
                                  fontSize: 18,
                                ),
                              ),
                              Spacer(),
                              Container(
                                margin: EdgeInsets.only(right: width * 0.05),
                                padding: EdgeInsets.symmetric(
                                  horizontal: Get.width * 0.04,
                                  vertical: Get.height * 0.005,
                                ),
                                decoration: BoxDecoration(
                                  color: ColorUtils.appColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  "blocked".tr,
                                  style: textStyleRes.smallText
                                      .copyWith(fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ))
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
