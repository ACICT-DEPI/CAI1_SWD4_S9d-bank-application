import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/success_reset_password_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../widget/auth/custom_button_auth.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImpl controller =
        Get.put(SuccessResetPasswordControllerImpl());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '45'.tr,
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
              '46'.tr,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '32'.tr,
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
                  print('go to login');
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
