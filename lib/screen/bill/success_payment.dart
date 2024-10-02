import 'package:flutter/material.dart';

import '../../core/constant/color.dart';
import '../../core/constant/imageAssets.dart';

class SuccessPayment extends StatelessWidget {
  const SuccessPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Illustration Image
          Image.asset(
            AppImageassets
                .successPayment, // Update this with the correct image asset path
            height: 200,
          ),
          const SizedBox(height: 30),

          // Title
          const Text(
            "Transaction successfully!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColor.primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),

          // Subtitle
          const Text(
            "You've pay your bill!",
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
              // controller.goToLogin();
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
    );
  }
}
