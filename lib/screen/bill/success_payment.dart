import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/bill/success_payment_controller.dart';
import '../../core/constant/color.dart';
import '../../core/constant/imageAssets.dart';

class SuccessPayment extends StatelessWidget {
  const SuccessPayment({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessPaymentControllerImpl controller =
        Get.put(SuccessPaymentControllerImpl());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Illustration Image
              Image.asset(
                AppImageassets
                    .successPayment, // Update this with the correct image asset path
                height: 200,
              ),
              const SizedBox(height: 30),

              // Title
              Text(
                "147".tr,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              // Subtitle
              Text(
                "148".tr,
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
                  controller.goToHome();
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
      ),
    );
  }
}
