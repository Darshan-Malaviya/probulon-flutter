import 'package:Probulon/common/color.dart';
import 'package:Probulon/controller/drawer_controller/setting_screen_controller.dart';
import 'package:Probulon/screens/drawer_screens/drawer.dart';
import 'package:Probulon/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  SettingCntrl settingCntrl = Get.put(SettingCntrl());

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    final height = Get.height;
    final width = Get.width;
    return GetBuilder<SettingCntrl>(
      id: 'setting',
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: height * 0.075,
            title: Text(
              "gerhold.net",
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
                    "armed".tr,
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
            child: Column(
              children: [
                SizedBox(height: height * 0.02),
                Container(
                  height: height * 0.1,
                  width: width,
                  decoration: BoxDecoration(
                    color:
                        isDarkMode ? ColorUtils.containerColor : Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: isDarkMode
                            ? Colors.transparent
                            : ColorUtils.shadowColor,
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(0.0, 0.2),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.07),
                        child: Icon(
                          Icons.settings,
                          size: 25,
                        ),
                      ),
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
                            "customize".tr,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: textStyleRes.mediumText.copyWith(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: 4,
                  padding: EdgeInsets.symmetric(vertical: height * 0.01),
                  itemBuilder: (context, index) {
                    return Container(
                      height: height * 0.075,
                      margin: EdgeInsets.symmetric(
                          horizontal: width * 0.01, vertical: height * 0.01),
                      decoration: BoxDecoration(
                        color: isDarkMode
                            ? ColorUtils.grey.withOpacity(0.3)
                            : Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: isDarkMode
                                ? Colors.transparent
                                : ColorUtils.shadowColor,
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0.0, 0.2),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.07),
                            child: Icon(
                              settingCntrl.icon[index],
                              size: 25,
                            ),
                          ),
                          Text(
                            "${settingCntrl.funcName[index]}".tr,
                            style: textStyleRes.mediumText.copyWith(
                              fontSize: 18,
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.only(right: width * 0.08),
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                        ],
                      ),
                    );
                  },
                ))
              ],
            ),
          ),
        );
      },
    );
  }
}
