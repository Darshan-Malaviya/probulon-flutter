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
    final height = Get.height;
    final width = Get.width;
    return GetBuilder<NavBarCntrl>(
      id: 'bottombar',
      builder: (controller) {
        return Scaffold(
          key: navBarCntrl.scaffoldKey,
          backgroundColor: isDarkMode ? Colors.black : Colors.white,
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
                label: "alarams".tr,
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
