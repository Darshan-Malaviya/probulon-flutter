/// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable

import 'package:Probulon/screens/dashbord_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Api/repository/login_repository.dart';
import '../common/images.dart';
import '../common/language_widget.dart';
import '../controller/localization_controller.dart';
import '../controller/sign_controller.dart';
import '../utils/pref_services.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  SigninCntrl signinCntrl = Get.put(SigninCntrl());
  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    final height = Get.height;
    final width = Get.width;

    Future<dynamic> handleLogin(email, password) async {
      final response = await LoginRepo().callLoginApi(
        email,
        password,
      );
      if (response['isSuccess'] == true && response['status'] == 'SUCCESS') {
        PrefService.setValue('isLogged', true);
        Get.to(DashBoardScreen());
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response['message']),
          ),
        );
      }
      return response;
    }

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
        child: GetBuilder<SigninCntrl>(
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
                    TextFormField(
                      controller: signinCntrl.emailcntrl,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "pleaseEnterTheMail".tr;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "mail".tr,
                        labelStyle: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.teal, width: 2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        border: OutlineInputBorder(
                          // borderSide: BorderSide(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                    TextFormField(
                      controller: signinCntrl.passcntrl,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "pleaseEnterThePassword".tr;
                        }
                        return null;
                      },
                      obscureText: controller.obsecure,
                      decoration: InputDecoration(
                        suffixIcon: InkResponse(
                          onTap: () {
                            controller.obsecure = !controller.obsecure;
                            controller.update(['sign']);
                          },
                          child: Icon(
                            controller.obsecure
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        labelText: "passLabel".tr,
                        labelStyle: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.teal, width: 2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        border: OutlineInputBorder(
                          // borderSide: BorderSide(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                    GestureDetector(
                      onTap: () {
                        if (controller.formKey.currentState!.validate()) {
                          handleLogin(
                            signinCntrl.emailcntrl.text,
                            signinCntrl.passcntrl.text,
                          );
                        }
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
                    ),
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
