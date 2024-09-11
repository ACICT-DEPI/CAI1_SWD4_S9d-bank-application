import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/functions/valid_input.dart';
import '../../../controller/auth/reset_password_controller.dart';
import '../../../widget/auth/custom_button_auth.dart';
import '../../../widget/auth/custom_textFormAuth.dart';
import '../../../widget/auth/custom_text_body_auth.dart';
import '../../../widget/auth/custom_text_title_auth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImpl controller =
        Get.put(ResetPasswordControllerImpl());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '38'.tr,
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
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              const SizedBox(height: 20),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      CustomTextTitleAuth(title: '39'.tr),
                      SizedBox(height: 10),
                      CustomTextBodyAuth(title: '40'.tr),
                      SizedBox(height: 30),
                      CustomTextformAuth(
                        keyboardType: TextInputType.text,
                        validator: (val) {
                          return validInput(val!, 8, 30, 'password');
                        },
                        hintTxt: '24'.tr,
                        icon: Icons.password_outlined,
                        labelTxt: '24'.tr,
                        myController: controller.newPasswordController,
                      ),
                      const SizedBox(height: 10),
                      CustomTextformAuth(
                        keyboardType: TextInputType.text,
                        validator: (val) {
                          return validInput(val!, 8, 30, 'password');
                        },
                        hintTxt: '41'.tr,
                        icon: Icons.password_outlined,
                        labelTxt: '42'.tr,
                        myController: controller.confirmPasswordController,
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              CustomButtonAuth(
                title: '43'.tr,
                onPressed: () {
                  controller.goToSuccessResetPassword();
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
