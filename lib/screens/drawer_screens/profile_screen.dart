import 'package:Probulon/common/color.dart';
import 'package:Probulon/controller/drawer_controller/profile_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  ProfileCntrl profileCntrl = Get.put(ProfileCntrl());

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    final height = Get.height;
    final width = Get.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Center(
                    child: CircleAvatar(
                      backgroundColor: ColorUtils.appColor,
                      maxRadius: width * 0.15,
                      child: Icon(Icons.person,
                          color: isDarkMode ? Colors.white : Colors.black,
                          size: 80),
                    ),
                  ),
                  Positioned(
                    top: height * 0.1,
                    left: width * 0.51,
                    child: InkResponse(
                      onTap: profileCntrl.getImage,
                      child: CircleAvatar(
                        backgroundColor: ColorUtils.grey,
                        maxRadius: 15,
                        child: Icon(
                          Icons.edit,
                          size: 18,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
