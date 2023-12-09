import 'package:Probulon/common/color.dart';
import 'package:Probulon/controller/scenarios_controller.dart';
import 'package:Probulon/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScenariosScreen extends StatelessWidget {
  ScenariosScreen({super.key});

  ScenariosCntrl scenariosCntrl = Get.put(ScenariosCntrl());
  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    final height = Get.height;
    final width = Get.width;
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: GetBuilder<ScenariosCntrl>(
        id: 'scenarios',
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.1),
              Row(
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
                        "sjjgohgjsdouuohjvnasjkvcmfd",
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
                  SizedBox(width: width * 0.03),
                ],
              ),
              SizedBox(height: height * 0.03),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
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
                          scenariosCntrl.switchValues[index] == true
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
                              value: scenariosCntrl.switchValues[index],
                              onChanged: (value) {
                                scenariosCntrl.switchValues[index] = value;
                                controller.update(['scenarios']);
                              },
                            ),
                          ),
                          SizedBox(width: width * 0.01),
                          Text(
                            "demotext",
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
