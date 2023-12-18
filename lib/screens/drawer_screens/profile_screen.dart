import 'package:Probulon/common/color.dart';
import 'package:Probulon/common/common_textfield.dart';
import 'package:Probulon/controller/drawer_controller/profile_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  ProfileCntrl profileCntrl = Get.put(ProfileCntrl());

  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    final width = Get.width;
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return GetBuilder<ProfileCntrl>(
      id: 'profilescreen',
      builder: (controller) {
        return Scaffold(
          backgroundColor: isDarkMode ? Colors.black : Colors.white,
          appBar: AppBar(
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: InkResponse(
                  onTap: () async {
                    if (profileCntrl.themeMode == true) {
                      profileCntrl.themeMode = false;
                    } else {
                      profileCntrl.themeMode = true;
                    }
                    profileCntrl.update(['profilescreen']);
                  },
                  child: Icon(
                    profileCntrl.themeMode ? Icons.dark_mode : Icons.light_mode,
                  ),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: height * 0.05),
                  profileWidget(context, isDarkMode, height, width,
                      profileCntrl.image, profileCntrl),
                  emailFields(isDarkMode, height, width, profileCntrl),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget profileWidget(BuildContext context, isDarkMode, height, width, image,
    ProfileCntrl profileCntrl) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Center(
        child: image == null
            ? CircleAvatar(
                backgroundColor: ColorUtils.appColor,
                maxRadius: width * 0.15,
                child: Icon(Icons.person,
                    color: isDarkMode ? Colors.white : Colors.black, size: 80),
              )
            : CircleAvatar(
                maxRadius: width * 0.15,
                backgroundImage: FileImage(profileCntrl.image!),
              ),
      ),
      Positioned(
        top: height * 0.1,
        left: width * 0.51,
        child: InkResponse(
          onTap: () {
            _showPickerDialog(context, profileCntrl);
          },
          child: CircleAvatar(
            backgroundColor: ColorUtils.grey,
            maxRadius: 18,
            child: Icon(
              Icons.edit,
              size: 18,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    ],
  );
}

Future<void> _showPickerDialog(
    BuildContext context, ProfileCntrl profileCntrl) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('Choose an option'),
        ),
        children: <Widget>[
          SimpleDialogOption(
            onPressed: () {
              profileCntrl.pickImage(ImageSource.camera);
            },
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(Icons.camera_alt_outlined),
                ),
                Text('Take a picture'),
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () => profileCntrl.pickImage(ImageSource.gallery),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(Icons.image_outlined),
                ),
                Text('Pick from gallery'),
              ],
            ),
          ),
        ],
      );
    },
  );
}

Widget emailFields(isDarkMode, height, width, ProfileCntrl profileCntrl) {
  return Column(
    children: [
      SizedBox(height: height * 0.05),
      CommonTextField(
        controller: profileCntrl.firstemailcntrl,
        lableText: 'firstemail'.tr,
        themeMode: isDarkMode,
        validationErrorText: 'Pleaseenterthefirstemail'.tr,
      ),
      SizedBox(height: height * 0.02),
      CommonTextField(
        controller: profileCntrl.firstemailcntrl,
        lableText: 'secondemail'.tr,
        themeMode: isDarkMode,
        validationErrorText: 'Pleaseenterthesecondemail'.tr,
      ),
      SizedBox(height: height * 0.02),
      CommonTextField(
        controller: profileCntrl.firstemailcntrl,
        lableText: 'thirdemail'.tr,
        themeMode: isDarkMode,
        validationErrorText: 'Pleaseenterthethirdemail'.tr,
      ),
    ],
  );
}
