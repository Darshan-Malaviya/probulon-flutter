import 'package:Probulon/controller/users_screen_controller.dart';
import 'package:Probulon/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/color.dart';

class UsersScreen extends StatelessWidget {
  UsersScreen({super.key});
  UserCntrl userCntrl = Get.put(UserCntrl());

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    final height = Get.height;
    final width = Get.width;
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: GetBuilder<UserCntrl>(
          id: 'notification',
          builder: (controller) {
            return Column(
              children: [
                SizedBox(height: height * 0.05),
                Container(
                  height: height * 0.1,
                  width: width,
                  padding: EdgeInsets.only(left: width * 0.05),
                  decoration: BoxDecoration(
                    color: isDarkMode
                        ? ColorUtils.grey.withOpacity(0.3)
                        : Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: isDarkMode ? Colors.transparent : Colors.grey,
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
                            "myfacilities".tr,
                            style: textStyleRes.mediumText.copyWith(
                              color: isDarkMode ? Colors.white : Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: height * 0.005),
                          Text(
                            "theseare".tr,
                            style: textStyleRes.mediumText.copyWith(
                              color: isDarkMode ? Colors.white : Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.add,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: 10,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: width * 0.01, vertical: height * 0.01),
                      decoration: BoxDecoration(
                        color: isDarkMode
                            ? ColorUtils.grey.withOpacity(0.3)
                            : Colors.white,
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: height * 0.005,
                                horizontal: width * 0.03),
                            child: Transform.scale(
                              scale: 1.3,
                              child: Switch(
                                inactiveTrackColor: isDarkMode
                                    ? Colors.white.withOpacity(0.5)
                                    : Colors.grey,
                                activeTrackColor: Colors.blue.withOpacity(0.8),
                                inactiveThumbColor: Colors.grey.shade50,
                                activeColor: Colors.white,
                                value: userCntrl.switchValues[index],
                                onChanged: (value) {
                                  userCntrl.switchValues[index] = value;
                                  controller.update(['notification']);
                                },
                              ),
                            ),
                          ),
                          Text(
                            "evidence".tr,
                            style: textStyleRes.mediumText.copyWith(
                              color: isDarkMode ? Colors.white : Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          Container(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.02),
                            margin: EdgeInsets.only(right: width * 0.05),
                            height: height * 0.025,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(7)),
                            child: Center(
                              child: Text(
                                "Demosf",
                                style: textStyleRes.mediumText.copyWith(
                                  fontSize: 15,
                                ),
                              ),
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
  }
}
