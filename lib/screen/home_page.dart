import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:vaulta/controller/home_page_controller.dart';
import 'package:vaulta/core/constant/color.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller using Get.put
    HomePageControllerImpl controller = Get.put(HomePageControllerImpl());

    return Scaffold(
      // Use Obx to reactively listen to changes in selectedIndex
      body: Obx(() {
        // Return the current tab's widget based on selectedIndex
        return controller.tabs[controller.selectedIndex.value];
      }),
      bottomNavigationBar: GNav(
        selectedIndex: controller.selectedIndex.value,
        onTabChange: (index) {
          controller.changeTab(index);
        },
        gap: 8,
        activeColor: Colors.white,
        color: Colors.black,
        backgroundColor: Colors.white,
        tabBackgroundColor: AppColor.primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
            margin: EdgeInsets.all(10),
          ),
          GButton(
            icon: Icons.currency_exchange_outlined,
            text: 'Exchange',
            margin: EdgeInsets.all(10),
          ),
          GButton(
            icon: Icons.settings_outlined,
            text: 'Settings',
            margin: EdgeInsets.all(10),
          ),
        ],
      ),
    );
  }
}
