import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaulta/controller/home_controller.dart';
import 'package:vaulta/core/constant/color.dart';
import 'package:vaulta/widget/home/custom_home_appbar.dart';
import 'package:vaulta/widget/home/visa_image.dart';

import '../widget/home/home_gridview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImpl controller = Get.put(HomeControllerImpl());
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90), // Custom app bar height
        child: AppBar(
          leading: null,
          backgroundColor: AppColor.primaryColor,
          title: Padding(
            padding: EdgeInsets.only(top: 16.0),
            // Observe changes in the username
            child: Obx(() => CustomHomeAppbar(
                  imagePath: controller.imagePath.value,
                  label: controller.username.value.isNotEmpty
                      ? controller.username.value
                      : 'Loading...',
                )),
          ),
        ),
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
