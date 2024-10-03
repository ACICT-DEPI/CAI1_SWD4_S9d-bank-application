import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:vaulta/core/constant/color.dart';

import '../controller/splash_screen_controller.dart';
import '../core/constant/imageAssets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SplashScreenControllerImpl controller =
        Get.put(SplashScreenControllerImpl());

    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImageassets.logo), // Ensure the correct image path
            const SizedBox(height: 20),
            Lottie.asset(
              'assets/animations/splash.json',
            ), // Ensure the correct Lottie file path
          ],
        ),
      ),
    );
  }
}
