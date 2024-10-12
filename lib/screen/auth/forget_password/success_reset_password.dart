import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaulta/core/constant/color.dart';
import 'package:vaulta/core/constant/imageAssets.dart';

import '../../../../controller/auth/success_reset_password_controller.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImpl controller =
        Get.put(SuccessResetPasswordControllerImpl());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Illustration Image
            Image.asset(
              AppImageassets
                  .resetPasswordImage, // Update this with the correct image asset path
              height: 200,
            ),
            const SizedBox(height: 30),

            // Title
            Text(
              "136".tr,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4B4FCF),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            // Subtitle
            Text(
              "139".tr,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // Button
            ElevatedButton(
              onPressed: () {
                controller.goToLogin();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primaryColor, // Button color
                padding: const EdgeInsets.symmetric(
                    vertical: 16, horizontal: 80), // Button size
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "138".tr,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
