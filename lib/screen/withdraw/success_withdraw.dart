import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaulta/controller/withdraw/success_withdraw_controller.dart';
import 'package:vaulta/core/constant/color.dart';
import 'package:vaulta/core/constant/imageAssets.dart';

class SuccessWithdraw extends StatelessWidget {
  const SuccessWithdraw({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessWithdrawControllerImpl controller =
        Get.put(SuccessWithdrawControllerImpl());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Replace with your own image asset or network image
            Image.asset(
              AppImageassets
                  .withdraw, // Use Image.network() if loading from the web
              height: 190,
              width: 340,
            ),
            SizedBox(height: 24),
            Text(
              'Successful withdrawal!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              'You have successfully withdrawn money!\nPlease check the balance in the card management section.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  controller.goToHome();
                },
                child: Text(
                  'Confirm',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                  backgroundColor: AppColor.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
