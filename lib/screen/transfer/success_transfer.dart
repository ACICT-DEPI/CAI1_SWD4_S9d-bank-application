import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaulta/controller/transfer/success_transfer_controller.dart';
import 'package:vaulta/core/constant/imageAssets.dart';
import 'package:vaulta/widget/auth/custom_button_auth.dart';

class SuccessTransferScreen extends StatelessWidget {
  const SuccessTransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessTransferControllerImpl controller =
        Get.put(SuccessTransferControllerImpl());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Success Transfer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image section
            Image.asset(
              AppImageassets
                  .successTransferImage, // Replace with your image asset
              height: 200,
            ),
            const SizedBox(height: 30),

            // Transfer successful text
            Text(
              'Transfer successful!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 10),

            // Confirmation text
            Text(
              'You have successfully transferred',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 5),
            Text(
              '\$${controller.amount} to ${controller.toUsername}!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
            SizedBox(height: 40),

            // Confirm button
            Row(
              children: [
                Expanded(
                    child: CustomButtonAuth(
                        title: 'Go to home',
                        onPressed: () {
                          controller.goToHomeScreen();
                        })),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
