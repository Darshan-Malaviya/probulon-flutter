import 'package:Probulon/common/color.dart';
import 'package:Probulon/controller/nav_bar_controller.dart';
import 'package:Probulon/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({super.key});

  NavBarCntrl navBarCntrl = Get.put(NavBarCntrl());

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    final height = Get.height;
    final width = Get.width;
    return GetBuilder<NavBarCntrl>(
      id: 'bottombar',
      builder: (controller) {
        return Scaffold(
          key: navBarCntrl.scaffoldKey,
          backgroundColor: isDarkMode ? Colors.black : Colors.white,
          appBar: AppBar(
            backgroundColor: isDarkMode ? Colors.black : Colors.white,
            toolbarHeight: height * 0.075,
            // backgroundColor: Colors.black,
            title: Text(
              navBarCntrl.title[navBarCntrl.currentIndex],
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            actions: [navBarCntrl.actions[navBarCntrl.currentIndex]],
            elevation: 0,
            leading: InkResponse(
              onTap: () {
                navBarCntrl.scaffoldKey.currentState?.openDrawer();
              },
              child: Icon(
                Icons.menu,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ),
          drawer: Drawer(
            backgroundColor: isDarkMode ? Colors.black : Colors.white,
            child: Column(
              children: [
                Container(
                  height: height * 0.6,
                  margin: EdgeInsets.only(
                      top: height * 0.06,
                      left: width * 0.04,
                      right: width * 0.04),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: isDarkMode
                        ? ColorUtils.grey.withOpacity(0.3)
                        : Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: isDarkMode
                            ? Colors.transparent
                            : Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(0.0, 0.2),
                      ),
                    ],
                  ),
                  child: ListView.builder(
                    itemCount: 9,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: height * 0.015),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.04),
                              child: Icon(
                                navBarCntrl.drawerIcons[index],
                                size: 25,
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                            Text(
                              "${navBarCntrl.drawerItems[index]}".tr,
                              style: textStyleRes.mediumText.copyWith(
                                  color:
                                      isDarkMode ? Colors.white : Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: height * 0.12,
                  margin: EdgeInsets.only(
                      top: height * 0.05,
                      left: width * 0.04,
                      right: width * 0.04),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: isDarkMode
                        ? ColorUtils.grey.withOpacity(0.3)
                        : Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: isDarkMode
                            ? Colors.transparent
                            : Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(0.0, 0.2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.04),
                            child: Icon(
                              Icons.logout,
                              size: 25,
                            ),
                          ),
                          Text(
                            "logout".tr,
                            style: textStyleRes.mediumText.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                        child: Text(
                          "copyrights".tr,
                          style: textStyleRes.mediumText.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: navBarCntrl.pages[navBarCntrl.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: isDarkMode ? Colors.black : Colors.white,
            currentIndex: navBarCntrl.currentIndex,
            selectedLabelStyle: const TextStyle(
              color: Colors.white,
            ),
            unselectedLabelStyle: const TextStyle(color: Colors.white),
            onTap: (index) {
              navBarCntrl.currentIndex = index;
              controller.update(['bottombar']);
            },
            type: BottomNavigationBarType.fixed, // Disable animation
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.workspaces_outline,
                  color: navBarCntrl.currentIndex == 0
                      ? Colors.white
                      : Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.workspaces,
                  color: navBarCntrl.currentIndex == 0
                      ? Colors.grey
                      : Colors.white,
                ),
                label: "devices".tr,
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.watch_later_outlined,
                  color: navBarCntrl.currentIndex == 1
                      ? Colors.white
                      : Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.watch_later,
                  color: navBarCntrl.currentIndex == 1
                      ? Colors.grey
                      : Colors.white,
                ),
                label: 'scenarios'.tr,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications,
                  color: navBarCntrl.currentIndex == 2
                      ? Colors.white
                      : Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.notifications_active,
                  color: navBarCntrl.currentIndex == 2
                      ? Colors.grey
                      : Colors.white,
                ),
                label: 'notifications'.tr,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.lock_outline,
                  color: navBarCntrl.currentIndex == 3
                      ? Colors.white
                      : Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.lock,
                  color: navBarCntrl.currentIndex == 3
                      ? Colors.grey
                      : Colors.white,
                ),
                label: 'start'.tr,
              ),
            ],
          ),
        );
      },
    );
  }
}
