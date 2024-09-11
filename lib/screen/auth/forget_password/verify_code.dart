import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';
import '../../../controller/auth/verify_code_controller.dart';
import '../../../widget/auth/custom_text_body_auth.dart';
import '../../../widget/auth/custom_text_title_auth.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImpl controller = Get.put(VerifyCodeControllerImpl());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '34'.tr,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: AppColor.grey,
                fontWeight: FontWeight.bold,
              ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColor.backgroundColor,
      ),
      body: Container(
        color: AppColor.backgroundColor,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    CustomTextTitleAuth(title: '35'.tr),
                    const SizedBox(height: 10),
                    CustomTextBodyAuth(title: '36'.tr),
                    const SizedBox(height: 30),
                    OtpTextField(
                      borderRadius: BorderRadius.circular(20),
                      fieldWidth: 50,
                      numberOfFields: 5,
                      borderColor: Color(0xFF512DA8),
                      //set to true to show as box or false to show as dash
                      showFieldAsBox: true,
                      //runs when a code is typed in
                      onCodeChanged: (String code) {
                        //handle validation or checks here
                      },
                      //runs when every textfield is filled
                      onSubmit: (String verificationCode) {
                        controller.goToResetPassword();
                      }, // end onSubmit
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
