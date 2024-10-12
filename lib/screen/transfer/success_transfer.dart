import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // This part will be captured in the screenshot
              Screenshot(
                controller: controller.screenshotController,
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        // Success Image
                        Image.asset(
                          AppImageassets.successTransferImage,
                          height: 200,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 20),

                        // Success Text
                        Text(
                          '112'.tr,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),

                        // Transfer details
                        Text(
                          '113'.tr,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '\$${controller.amount} ${'114'.tr} ${controller.toUsername}!',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),

              // Confirm Button and Share Button section
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomButtonAuth(
                          title: '115'.tr,
                          onPressed: () {
                            controller.goToHomeScreen();
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Share Screenshot Button
                  ElevatedButton.icon(
                    onPressed: () {
                      controller.takeScreenshot();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 24,
                      ),
                    ),
                    icon: const Icon(
                      Icons.share_outlined,
                      color: Colors.white,
                    ),
                    label: Text(
                      '116'.tr,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
