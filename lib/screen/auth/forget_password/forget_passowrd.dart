import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/functions/valid_input.dart';
import '../../../controller/auth/forget_password_controller.dart';
import '../../../widget/auth/custom_button_auth.dart';
import '../../../widget/auth/custom_textFormAuth.dart';
import '../../../widget/auth/custom_text_body_auth.dart';
import '../../../widget/auth/custom_text_title_auth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImpl controller =
        Get.put(ForgetPasswordControllerImpl());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '44'.tr,
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
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      CustomTextTitleAuth(title: '31'),
                      const SizedBox(height: 10),
                      CustomTextBodyAuth(
                          title:
                              'Please enter your Email Adderss to reset your password'),
                      const SizedBox(height: 30),
                      CustomTextformAuth(
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) {
                          return validInput(val!, 5, 100, 'email');
                        },
                        hintTxt: 'Enter your email',
                        icon: Icons.email_outlined,
                        labelTxt: 'Email',
                        myController: controller.emailController,
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              CustomButtonAuth(
                title: 'Check Email',
                onPressed: () {
                  controller.goToVerifiedCode();
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
