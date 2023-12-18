// ignore_for_file: must_be_immutable

import 'package:Probulon/common/color.dart';
import 'package:Probulon/common/images.dart';
import 'package:Probulon/screens/drawer_screens/drawer.dart';
import 'package:Probulon/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/drawer_controller/facilities_controller.dart';

class FacilitiesScreen extends StatelessWidget {
  FacilitiesScreen({super.key});
  FacilitiesCntrl facilitiesCntrl = Get.put(FacilitiesCntrl());
  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    final height = Get.height;
    final width = Get.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.075,
        title: Text(
          "evidence".tr,
          style: textStyleRes.mediumText,
        ),
        elevation: 0,
        actions: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.03,
                  vertical: Get.height * 0.008,
                ),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  "armed".tr,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: GetBuilder<FacilitiesCntrl>(
          id: 'facilities',
          builder: (controller) {
            return Column(
              children: [
                SizedBox(height: height * 0.01),
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
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "myfacilities".tr,
                        style: textStyleRes.mediumText.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: height * 0.005),
                      Text(
                        "theseare".tr,
                        style: textStyleRes.mediumText.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: 10,
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
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                // horizontal: width * 0.03,
                                vertical: height * 0.02),
                            child: Transform.scale(
                              scale: 1.3,
                              child: Switch(
                                inactiveTrackColor: isDarkMode
                                    ? Colors.white.withOpacity(0.5)
                                    : Colors.grey,
                                activeTrackColor: Colors.blue.withOpacity(0.8),
                                inactiveThumbColor: Colors.grey.shade50,
                                activeColor: Colors.white,
                                value: facilitiesCntrl.switchValues[index],
                                onChanged: (value) {
                                  facilitiesCntrl.switchValues[index] = value;
                                  controller.update(['facilities']);
                                },
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "evidence".tr,
                                style: textStyleRes.mediumText.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                width: width * 0.4,
                                child: Text(
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  "evidencezdievidencezdievidencezdi",
                                  style: textStyleRes.mediumText.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.02),
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
