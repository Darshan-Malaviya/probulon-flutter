import 'package:Probulon/common/color.dart';
import 'package:Probulon/controller/dash_board_controller/scenarios_controller.dart';
import 'package:Probulon/screens/dash_board/add_scenarios_screen.dart';
import 'package:Probulon/screens/drawer_screens/drawer.dart';
import 'package:Probulon/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScenariosScreen extends StatelessWidget {
  ScenariosScreen({super.key});

  ScenariosCntrl seenarioCntrl = Get.put(ScenariosCntrl());
  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    final height = Get.height;
    final width = Get.width;
    return Scaffold(
      key: seenarioCntrl.scaffoldKey,
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        toolbarHeight: height * 0.075,
        title: Text(
          "nitzsche.com".tr,
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
          ),
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
                  "blocked".tr,
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
        leading: InkResponse(
          onTap: () {
            seenarioCntrl.scaffoldKey.currentState?.openDrawer();
          },
          child: Icon(
            Icons.menu,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
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
                          "scenarios".tr,
                          style: textStyleRes.mediumText.copyWith(
                            color: isDarkMode ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "createscenario".tr,
                          style: textStyleRes.mediumText.copyWith(
                            color: isDarkMode ? Colors.white : Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
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
                        color: isDarkMode ? Colors.white : Colors.black,
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
                        Get.to(AddScrenario());
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: height * 0.008),
                        height: height * 0.07,
                        width: width,
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
                              offset: Offset(1, 1),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            seenarioCntrl.switchValues[index] == true
                                ? Container(
                                    width: width * 0.015,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                    ),
                                  )
                                : SizedBox(
                                    width: width * 0.015,
                                  ),
                            Transform.scale(
                              scale: 1.3,
                              child: Switch(
                                inactiveTrackColor: isDarkMode
                                    ? Colors.white.withOpacity(0.5)
                                    : Colors.grey,
                                activeTrackColor: Colors.blue.withOpacity(0.8),
                                inactiveThumbColor: Colors.grey.shade50,
                                activeColor: Colors.white,
                                value: seenarioCntrl.switchValues[index],
                                onChanged: (value) {
                                  seenarioCntrl.switchValues[index] = value;
                                  controller.update(['scenarios']);
                                },
                              ),
                            ),
                            SizedBox(width: width * 0.01),
                            Text(
                              seenarioCntrl.name[index],
                              style: textStyleRes.mediumText.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: isDarkMode ? Colors.white : Colors.black,
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
