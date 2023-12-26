import 'package:Probulon/controller/dash_board_controller/dash_board_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({super.key});

  NavBarCntrl navBarCntrl = Get.put(NavBarCntrl());

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return GetBuilder<NavBarCntrl>(
      id: 'bottombar',
      builder: (controller) {
        return Scaffold(
          key: navBarCntrl.scaffoldKey,
          body: navBarCntrl.pages[navBarCntrl.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: navBarCntrl.currentIndex,
            onTap: (index) {
              navBarCntrl.currentIndex = index;
              controller.update(['bottombar']);
            },
            fixedColor: isDarkMode ? Colors.white : Colors.black,
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
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
                label: "alarams".tr,
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
                  color: isDarkMode ? Colors.white : Colors.black,
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
                  color: isDarkMode ? Colors.white : Colors.black,
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
                  color: isDarkMode ? Colors.white : Colors.black,
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
