import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:vaulta/controller/home_page_controller.dart';
import 'package:vaulta/core/constant/color.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageControllerImpl controller = Get.put(HomePageControllerImpl());

    return Scaffold(
      body: Obx(() {
        // Observing the selected tab index to render the correct tab
        return controller.tabs[controller.selectedIndex.value];
      }),
      bottomNavigationBar: Obx(() {
        // Wrapping GNav with Obx to observe changes to selectedIndex
        return GNav(
          selectedIndex: controller
              .selectedIndex.value, // Ensure GNav uses the observed index
          onTabChange: (index) {
            controller
                .changeTab(index); // Update tab when a new tab is selected
          },
          gap: 8,
          activeColor: Colors.white,
          color: Colors.black,
          backgroundColor: Colors.white,
          tabBackgroundColor: AppColor.primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          tabs: [
            GButton(
              icon: Icons.home,
              text: '80'.tr, // Localized text
              margin: const EdgeInsets.all(10),
            ),
            GButton(
              icon: Icons.currency_exchange_outlined,
              text: '81'.tr, // Localized text
              margin: const EdgeInsets.all(10),
            ),
            GButton(
              icon: Icons.settings_outlined,
              text: '82'.tr, // Localized text
              margin: const EdgeInsets.all(10),
            ),
          ],
        );
      }),
    );
  }
}
