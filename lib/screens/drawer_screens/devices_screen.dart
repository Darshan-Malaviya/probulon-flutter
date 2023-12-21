import 'package:Probulon/common/color.dart';
import 'package:Probulon/controller/dash_board_controller/scenarios_controller.dart';
import 'package:Probulon/controller/drawer_controller/devices_controller.dart';
import 'package:Probulon/screens/dash_board/device_detail_screen.dart';
import 'package:Probulon/screens/drawer_screens/drawer.dart';
import 'package:Probulon/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DevicesScreen extends StatelessWidget {
  DevicesScreen({super.key});

  DeviceCntrl deviceCntrl = Get.put(DeviceCntrl());
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
          "greenfelder.com".tr,
          style: TextStyle(),
        ),
        elevation: 0,
        actions: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: width * 0.03),
                padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.04,
                  vertical: Get.height * 0.008,
                ),
                decoration: BoxDecoration(
                  color: ColorUtils.appColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  "disarmed".tr,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: CommonDrawer(),
      body: GetBuilder<ScenariosCntrl>(
        id: 'scenarios',
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.1),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "mydevice".tr,
                          style: textStyleRes.mediumText.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: width * 0.8,
                          child: Text(
                            "createdevice".tr,
                            style: textStyleRes.mediumText.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    CircleAvatar(
                      maxRadius: 25,
                      backgroundColor: Colors.lightBlue,
                      child: Icon(
                        Icons.add,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.03),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(DeviceDetailScreen(
                          name: deviceCntrl.name[index],
                        ));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: height * 0.008),
                        height: height * 0.07,
                        width: width,
                        decoration: BoxDecoration(
                          color: isDarkMode
                              ? ColorUtils.containerColor
                              : Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color:
                                  isDarkMode ? Colors.transparent : Colors.grey,
                              spreadRadius: 0.5,
                              blurRadius: 1,
                              offset: Offset(1, 1),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Transform.scale(
                              scale: 1.3,
                              child: Switch(
                                inactiveTrackColor: isDarkMode
                                    ? Colors.white.withOpacity(0.5)
                                    : Colors.grey,
                                activeTrackColor: Colors.blue.withOpacity(0.8),
                                inactiveThumbColor: Colors.grey.shade50,
                                activeColor: Colors.white,
                                value: deviceCntrl.switchValues[index],
                                onChanged: (value) {
                                  deviceCntrl.switchValues[index] = value;
                                  controller.update(['scenarios']);
                                },
                              ),
                            ),
                            SizedBox(width: width * 0.01),
                            Text(
                              deviceCntrl.name[index],
                              style: textStyleRes.mediumText.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                            ),
                            SizedBox(width: width * 0.02),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
