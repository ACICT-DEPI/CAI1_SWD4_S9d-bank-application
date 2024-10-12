import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaulta/controller/home_controller.dart';
import 'package:vaulta/controller/home_page_controller.dart';
import 'package:vaulta/core/constant/color.dart';
import 'package:vaulta/widget/home/custom_home_appbar.dart';
import 'package:vaulta/widget/home/visa_image.dart';

import '../widget/home/home_gridview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImpl controller = Get.put(HomeControllerImpl());
    HomePageControllerImpl homePageController =
        Get.put(HomePageControllerImpl());
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90), // Custom app bar height
        child: AppBar(
            elevation: 0,
            leading: null,
            backgroundColor: AppColor.primaryColor,
            title: Obx(() {
              return InkWell(
                onTap: () {
                  homePageController.changeTab(2); // Set tab to Settings tab
                  homePageController.selectedIndex.value = 2;
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: CustomHomeAppbar(
                    imagePath: controller.imagePath.value,
                    label: controller.username.value.isNotEmpty
                        ? controller.username.value
                        : '62'.tr,
                  ),
                ),
              );
            })),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: AppColor.primaryColor,
          child: Column(
            children: [
              // Main Container with Rounded Top Corners
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(16),
                height: screenSize.height * 0.8,
                width: screenSize.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    VisaImage(),
                    const SizedBox(height: 16),
                    HomeGridview(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
