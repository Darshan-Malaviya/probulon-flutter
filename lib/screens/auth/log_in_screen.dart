/// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable

import 'package:Probulon/Api/api_response.dart';
import 'package:Probulon/Api/response_model/log_in_response_model.dart';
import 'package:Probulon/common/common_textfield.dart';
import 'package:Probulon/screens/dash_board/dashbord_screen.dart';
import 'package:Probulon/utils/pref_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/images.dart';
import '../../common/language_widget.dart';
import '../../controller/auth_controller/log_in_controller.dart';
import '../../controller/localization_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  LoginScreenController logInScreenController =
      Get.put(LoginScreenController());
  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    final height = Get.height;
    final width = Get.width;
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        elevation: isDarkMode ? 0 : 2,
        toolbarHeight: height * 0.075,
        backgroundColor:
            isDarkMode ? Colors.black.withOpacity(0.2) : Colors.white,
        actions: [
          GestureDetector(
            onTap: () {
              Get.bottomSheet(
                backgroundColor: Colors.transparent,
                Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30)),
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30)),
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: GetBuilder<LocalizationController>(
                          builder: (localizationController) {
                            return Column(
                              // mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'select_language'.tr,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                ListView.builder(
                                    itemCount: 2,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) =>
                                        LanguageWidget(
                                          languageModel: localizationController
                                              .languages[index],
                                          localizationController:
                                              localizationController,
                                          index: index,
                                        )),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: height * 0.012,
                horizontal: width * 0.04,
              ),
              width: width * 0.5,
              decoration: BoxDecoration(
                border: Border.all(
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "directToTheCloud".tr,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(width: width * 0.02),
                  Image.asset(
                    ImgRes.cloud,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: GetBuilder<LoginScreenController>(
          id: 'sign',
          builder: (controller) {
            return Form(
              key: controller.formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: height * 0.1),
                    Container(
                      height: height * 0.08,
                      width: width * 0.4,
                      color: Colors.white,
                    ),
                    SizedBox(height: height * 0.05),
                    Text(
                      "welcome".tr,
                      style: TextStyle(
                        fontSize: 30,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    SizedBox(height: height * 0.005),
                    Text(
                      "log_in".tr,
                      style: TextStyle(
                        fontSize: 18,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                    CommonTextField(
                      lableText: "mail",
                      validationErrorText: 'pleaseEnterTheMail',
                      controller: logInScreenController.emailController,
                      themeMode: isDarkMode,
                    ),
                    SizedBox(height: height * 0.03),
                    CommonTextField(
                      lableText: "passLabel",
                      validationErrorText: 'pleaseEnterThePassword',
                      controller: logInScreenController.passwordController,
                      themeMode: isDarkMode,
                    ),
                    SizedBox(height: height * 0.03),
                    GetBuilder<LoginScreenController>(builder: (controller) {
                      if (controller.apiResponseLogin.status ==
                              Status.INITIAL ||
                          controller.apiResponseLogin.status ==
                              Status.COMPLETE ||
                          controller.apiResponseLogin.status == Status.ERROR) {
                        return GestureDetector(
                          onTap: () async {
                            await controller.logInViewModel({
                              "email":
                                  logInScreenController.emailController.text,
                              "password":
                                  logInScreenController.passwordController.text,
                            });
                            if (controller.apiResponseLogin.status ==
                                Status.COMPLETE) {
                              LogInResponseModel data =
                                  controller.apiResponseLogin.data;
                              if (data.isSuccess == true) {
                                PrefService.setValue('isLogged', true);
                                PrefService.setValue('token', data.data.token);
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DashBoardScreen(),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('${data.message}')));
                              }
                            }
                            // if (formKey.currentState!.validate()) ;
                          },
                          child: Container(
                            height: height * 0.06,
                            width: width * 0.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.blue,
                            ),
                            child: Center(child: Text("log_in".tr)),
                          ),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
