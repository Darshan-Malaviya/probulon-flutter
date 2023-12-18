import 'package:Probulon/common/color.dart';
import 'package:Probulon/controller/dash_board_controller/notification_screen_controller.dart';
import 'package:Probulon/screens/drawer_screens/drawer.dart';
import 'package:Probulon/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  NotificationCntrl notificationCntrl = Get.put(NotificationCntrl());

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
                "asleep".tr,
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
        child: GetBuilder<NotificationCntrl>(
          id: 'facilities',
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
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                        child: Icon(
                          Icons.notifications_active_outlined,
                          size: 25,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "notifications".tr,
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
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      height: height * 0.09,
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
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 25,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "evidence".tr,
                                style: textStyleRes.mediumText.copyWith(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                width: width * 0.4,
                                child: Text(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  "evidencezdievidendei",
                                  style: textStyleRes.mediumText.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          CircleAvatar(
                            maxRadius: 10,
                            backgroundColor: Colors.red,
                            child: Center(
                              child: Text(
                                '1',
                                style: textStyleRes.smallText
                                    .copyWith(fontSize: 15),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.delete,
                            size: 25,
                            color: Colors.red,
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
