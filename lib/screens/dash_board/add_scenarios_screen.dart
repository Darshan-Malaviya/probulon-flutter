import 'package:Probulon/common/color.dart';
import 'package:Probulon/common/common_textfield.dart';
import 'package:Probulon/controller/dash_board_controller/add_scenarios_controller.dart';
import 'package:Probulon/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddScrenario extends StatelessWidget {
  AddScrenario({super.key});

  AddScenarios addScenarios = Get.put(AddScenarios());

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    final height = Get.height;
    final width = Get.width;
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        leading: InkResponse(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        title: Text(
          "gerlach.com".tr,
          style: textStyleRes.mediumText.copyWith(
            fontWeight: FontWeight.w500,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: GetBuilder<AddScenarios>(
          id: 'addscenario',
          builder: (controller) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: height * 0.04),
                  Container(
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: isDarkMode
                          ? ColorUtils.grey.withOpacity(0.3)
                          : Colors.white,
                      border: Border.all(color: Colors.black, width: 0.1),
                      boxShadow: [
                        BoxShadow(
                          color: isDarkMode
                              ? Colors.transparent
                              : ColorUtils.appColor,
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0.0, 0.2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.05, vertical: height * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "scenariotype".tr,
                            style: textStyleRes.mediumText.copyWith(
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                          SizedBox(height: height * 0.005),
                          Text(
                            "desctype".tr,
                            style: textStyleRes.mediumText.copyWith(
                              fontSize: 16,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Container(
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: isDarkMode
                          ? ColorUtils.grey.withOpacity(0.3)
                          : Colors.white,
                      border: Border.all(color: Colors.black, width: 0.1),
                      boxShadow: [
                        BoxShadow(
                          color: isDarkMode
                              ? Colors.transparent
                              : ColorUtils.appColor,
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0.0, 0.2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.05, vertical: height * 0.015),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonTextField(
                            themeMode: isDarkMode,
                            controller: addScenarios.nameCntrl,
                            lableText: 'name',
                            validationErrorText: 'namevalidation',
                          ),
                          SizedBox(height: height * 0.03),
                          CommonTextField(
                            themeMode: isDarkMode,
                            controller: addScenarios.descCntrl,
                            lableText: 'dec',
                            validationErrorText: 'descriptionvalidation',
                          ),
                          SizedBox(height: height * 0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "update".tr,
                                  style: textStyleRes.mediumText.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        isDarkMode ? Colors.white : Colors.teal,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "eliminate".tr,
                                  style: textStyleRes.mediumText.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color:
                                        isDarkMode ? Colors.white : Colors.teal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Container(
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: isDarkMode
                          ? ColorUtils.grey.withOpacity(0.3)
                          : Colors.white,
                      border: Border.all(color: Colors.black, width: 0.1),
                      boxShadow: [
                        BoxShadow(
                          color: isDarkMode
                              ? Colors.transparent
                              : ColorUtils.appColor,
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0.0, 0.2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.05, vertical: height * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "scenariotype".tr,
                            style: textStyleRes.mediumText.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                          SizedBox(height: height * 0.04),
                          Container(
                            height: height * 0.04,
                            width: width,
                            decoration: BoxDecoration(
                              color: ColorUtils.appColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(
                                2,
                                (index) => GestureDetector(
                                  onTap: () {
                                    addScenarios.select = index;
                                    controller.update(['addscenario']);
                                  },
                                  child: Container(
                                    width: width * 0.39,
                                    margin: EdgeInsets.symmetric(
                                      vertical: height * 0.003,
                                    ),
                                    decoration: BoxDecoration(
                                      color: addScenarios.select == index
                                          ? Colors.white
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                        child: Text(
                                      "${addScenarios.type[index]}".tr,
                                      style: textStyleRes.mediumText.copyWith(
                                        fontSize: 16,
                                        color: isDarkMode
                                            ? addScenarios.select == index
                                                ? Colors.black
                                                : Colors.white
                                            : Colors.black,
                                      ),
                                    )),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Container(
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: isDarkMode
                          ? ColorUtils.grey.withOpacity(0.3)
                          : Colors.white,
                      border: Border.all(color: Colors.black, width: 0.1),
                      boxShadow: [
                        BoxShadow(
                          color: isDarkMode
                              ? Colors.transparent
                              : ColorUtils.appColor,
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0.0, 0.2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.05, vertical: height * 0.02),
                      child: Text(
                        "dailyexecution".tr,
                        style: textStyleRes.smallText.copyWith(
                          fontSize: 18,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
