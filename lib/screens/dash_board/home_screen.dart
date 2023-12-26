import 'package:Probulon/Api/api_response.dart';
import 'package:Probulon/Api/response_model/get_lock_status_response_model.dart';
import 'package:Probulon/Notification/notification_repo.dart';
import 'package:Probulon/common/color.dart';
import 'package:Probulon/common/images.dart';
import 'package:Probulon/controller/dash_board_controller/home_screen_controller.dart';
import 'package:Probulon/screens/drawer_screens/drawer.dart';
import 'package:Probulon/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../common/common_button.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  HomeScreenCntrl homeScreenCntrl = Get.put(HomeScreenCntrl());

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    final height = Get.height;
    final width = Get.width;
    return Scaffold(
      key: homeScreenCntrl.scaffoldKey,
      appBar: AppBar(
        toolbarHeight: height * 0.075,
        title: Text(
          "test".tr,
          style: textStyleRes.mediumText.copyWith(fontWeight: FontWeight.w500),
        ),
        elevation: 0,
        actions: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.02,
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
      body: GetBuilder<HomeScreenCntrl>(
        id: 'home',
        builder: (controller) {
          if (controller.apiResponseGetLockStatus.status == Status.INITIAL ||
              controller.apiResponseGetLockStatus.status == Status.COMPLETE ||
              controller.apiResponseGetLockStatus.status == Status.ERROR) {
            GetLockStatusResponseModel data =
                controller.apiResponseGetLockStatus.data;

            return SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CommonButton(
                        onTap: () {},
                        height: height * 0.09,
                        width: width * 0.45,
                        decoratioin: BoxDecoration(
                            color: ColorUtils.appColor,
                            borderRadius: BorderRadius.circular(40)),
                        child: Center(
                          child: Text(
                            "partial".tr,
                            style: textStyleRes.mediumText.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      CommonButton(
                        onTap: () {},
                        height: height * 0.09,
                        width: width * 0.45,
                        decoratioin: BoxDecoration(
                            color: ColorUtils.appColor,
                            borderRadius: BorderRadius.circular(40)),
                        child: Center(
                          child: Text(
                            "youare".tr,
                            style: textStyleRes.mediumText.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.05),
                  GestureDetector(
                    onTap: () async {
                      homeScreenCntrl.isIconChanges =
                          !homeScreenCntrl.isIconChanges;

                      await homeScreenCntrl.updateLockStatusviewModel(body: {
                        "deviceId": "6575b58a204be2aa8a57113d",
                        "isLocked": homeScreenCntrl.isIconChanges.toString()
                      }, header: {
                        'Authorization': 'Bearer ${homeScreenCntrl.token}',
                      });

                      await homeScreenCntrl.getLockStatusviewModel(body: {
                        "deviceId": "6575b58a204be2aa8a57113d"
                      }, header: {
                        'Authorization': 'Bearer ${homeScreenCntrl.token}',
                      });

                      await toast(
                          msgText: data.data.isLocked
                              ? "deviceIsUnLocked".tr
                              : "deviceIsLocked".tr,
                          themeMode: isDarkMode,
                          textColor: data.data.isLocked
                              ? Colors.red
                              : isDarkMode
                                  ? Colors.black
                                  : Colors.white);

                      await SendNotification().sendNotification(
                        data.data.isLocked
                            ? "deviceIsUnLocked".tr
                            : "deviceIsLocked".tr,
                      );
                      controller.update(['home']);
                    },
                    child: CircleAvatar(
                      maxRadius: width * 0.3,
                      backgroundColor:
                          isDarkMode ? Colors.white : ColorUtils.appColor,
                      child: CircleAvatar(
                        maxRadius: width * 0.25,
                        backgroundColor:
                            data.data.isLocked ? Colors.green : Colors.red,
                        child: Icon(
                          data.data.isLocked ? Icons.lock : Icons.lock_open,
                          size: 80,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      2,
                      (index) => CommonButton(
                        onTap: () async {
                          /// Update Lock Status By

                          await homeScreenCntrl
                              .updateLockStatusByviewModel(body: {
                            "deviceId": "6575b58a204be2aa8a57113d",
                            "updateLockStatusBy":
                                homeScreenCntrl.name[index].toString(),
                          }, header: {
                            'Authorization': 'Bearer ${homeScreenCntrl.token}',
                          });

                          /// Get Lock Status
                          await homeScreenCntrl.getLockStatusviewModel(body: {
                            "deviceId": "6575b58a204be2aa8a57113d"
                          }, header: {
                            'Authorization': 'Bearer ${homeScreenCntrl.token}',
                          });

                          toast(
                              msgText: data.data.updateLockStatusBy == "Manual"
                                  ? "switchedtoAuto".tr
                                  : "switchedtoManual".tr,
                              themeMode: isDarkMode,
                              textColor:
                                  isDarkMode ? Colors.black : Colors.white);

                          SendNotification().sendNotification(
                            data.data.updateLockStatusBy == "Manual"
                                ? "switchedtoAuto".tr
                                : "switchedtoManual".tr,
                          );

                          homeScreenCntrl.index = index;
                          controller.update(['home']);
                        },
                        height: height * 0.09,
                        width: width * 0.45,
                        decoratioin: BoxDecoration(
                            color: data.data.updateLockStatusBy ==
                                    homeScreenCntrl.name[index]
                                ? Colors.red
                                : Colors.grey.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(40)),
                        child: Center(
                          child: Text(
                            homeScreenCntrl.name[index],
                            style: textStyleRes.mediumText.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: SpinKitFadingCircle(
                color: Colors.blue,
                size: 40,
              ),
            );
          }
        },
      ),
    );
  }

  Future<bool?> toast({required msgText, themeMode, textColor}) {
    return Fluttertoast.showToast(
        msg: msgText,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: themeMode ? Colors.white : Colors.black,
        textColor: textColor,
        fontSize: 16);
  }
}
