import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../controller/auth/success_signup_controller.dart';
import '../../core/constant/imageAssets.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignupControllerImpl controller =
        Get.put(SuccessSignupControllerImpl());
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
            const Text(
              "Email sent successfully!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4B4FCF),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            // Subtitle
            const Text(
              "We have sent an email to verify your account. Please check your email to complete your sign in.",
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
              child: const Text(
                "Ok",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
