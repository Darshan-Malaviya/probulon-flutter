import 'package:Probulon/common/color.dart';
import 'package:Probulon/controller/device_detail_controller.dart';
import 'package:Probulon/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeviceDetailScreen extends StatelessWidget {
  DeviceDetailScreen({super.key, this.name});

  final name;

  DeviceDetail deviceDetail = Get.put(DeviceDetail());
  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    final height = Get.height;
    final width = Get.width;
    return Scaffold(
      body: GetBuilder<DeviceDetail>(
        id: 'devicedetail',
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.15),
                Center(
                  child: Text(
                    name,
                    style: textStyleRes.largeText.copyWith(
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                      color: isDarkMode
                          ? Colors.white
                          : Colors.black.withOpacity(0.7),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.1),
                InkResponse(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back,
                  ),
                ),
                SizedBox(height: height * 0.05),
                Container(
                  height: height * 0.07,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "myfacilitiesfdhb".tr,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: textStyleRes.mediumText.copyWith(
                          color: isDarkMode ? Colors.white : Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.02),
                Container(
                  height: height * 0.06,
                  width: width,
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "myfacilitiesfdhb".tr,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: textStyleRes.mediumText.copyWith(
                          color: isDarkMode ? Colors.white : Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                      Transform.scale(
                        scale: 1.3,
                        child: Switch(
                          inactiveTrackColor: isDarkMode
                              ? Colors.white.withOpacity(0.5)
                              : Colors.grey,
                          activeTrackColor: Colors.blue.withOpacity(0.8),
                          inactiveThumbColor: Colors.grey.shade50,
                          activeColor: Colors.white,
                          value: deviceDetail.isSwitch,
                          onChanged: (value) {
                            deviceDetail.isSwitch = value;
                            controller.update(['devicedetail']);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.02),
                Container(
                  height: height * 0.09,
                  width: width,
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
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
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: height * 0.005),
                        child: RichText(
                          text: TextSpan(
                            text: "volumelevel".tr,
                            style: textStyleRes.mediumText.copyWith(
                              color: isDarkMode ? Colors.white : Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' ${deviceDetail.sliderValue * 100}%',
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkResponse(
                            onTap: () {
                              deviceDetail.sliderValue = double.parse(
                                  (deviceDetail.sliderValue - 0.1)
                                      .toStringAsFixed(2));
                              if (deviceDetail.sliderValue < 0.0) {
                                deviceDetail.sliderValue = 0.0;
                              }
                              controller.update(['devicedetail']);
                            },
                            child: Icon(
                              Icons.remove,
                            ),
                          ),
                          Slider(
                            value: deviceDetail.sliderValue,
                            onChanged: (value) {
                              deviceDetail.sliderValue = value;
                              controller.update(['devicedetail']);
                            },
                          ),
                          InkResponse(
                            onTap: () {
                              if (deviceDetail.sliderValue < 1.0) {
                                deviceDetail.sliderValue = double.parse(
                                    (deviceDetail.sliderValue + 0.1)
                                        .toStringAsFixed(2));
                                print(deviceDetail.sliderValue);
                                controller.update(['devicedetail']);
                              }
                            },
                            child: Icon(
                              Icons.add,
                            ),
                          ),
                        ],
                      )
                    ],
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
