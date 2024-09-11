import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../controller/auth/success_signup_controller.dart';
import '../../widget/auth/custom_button_auth.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignupControllerImpl controller =
        Get.put(SuccessSignupControllerImpl());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '15'.tr,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: AppColor.grey,
                fontWeight: FontWeight.bold,
              ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColor.backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Center(
              child: const Icon(
                Icons.check_circle,
                color: AppColor.primaryColor,
                size: 200,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '16'.tr,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '17'.tr,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              child: CustomButtonAuth(
                title: '18'.tr,
                onPressed: () {
                  controller.goToLogin();
                },
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
