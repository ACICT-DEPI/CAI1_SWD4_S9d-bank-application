import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../controller/auth/signup_controller.dart';
import '../../core/constant/imageAssets.dart';
import '../../core/functions/awesome_dialoge.dart';
import '../../core/functions/valid_input.dart';
import '../../widget/auth/custom_button_auth.dart';
import '../../widget/auth/custom_textFormAuth.dart';
import '../../widget/auth/custom_text_body_auth.dart';
import '../../widget/auth/custom_text_title_auth.dart';
import '../../widget/auth/logo_auth.dart';
import '../../widget/auth/text_signup.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    SignupControllerImpl controller = Get.put(SignupControllerImpl());

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: AppBar(
          backgroundColor: AppColor.primaryColor,
          title: Padding(
            padding: const EdgeInsets.only(top: 12, left: 12),
            child: Text(
              '19'.tr,
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: () => showAwesomeDialog(
          context,
          title: 'Exit',
          desc: 'Are you sure you want to go out?',
          onOk: () {
            exit(0);
          },
          dialogType: DialogType.warning,
          onCancel: () {
            Get.back();
          },
        ),
        child: SingleChildScrollView(
          child: Container(
            color: AppColor.primaryColor,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    CustomTextTitleAuth(title: '48'.tr),
                    const SizedBox(height: 8),
                    CustomTextBodyAuth(title: '49'.tr),
                    const SizedBox(height: 24),
                    Center(child: LogoAuth(imageAsset: AppImageassets.signup)),
                    const SizedBox(height: 24),
                    CustomTextformAuth(
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        return validInput(val!, 5, 100, 'username');
                      },
                      hintTxt: '20'.tr,
                      labelTxt: '21'.tr,
                      myController: controller.usernameController,
                      isPassword: false,
                    ),
                    CustomTextformAuth(
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) {
                        return validInput(val!, 5, 100, 'email');
                      },
                      hintTxt: '22'.tr,
                      labelTxt: '23'.tr,
                      myController: controller.emailController,
                      isPassword: false,
                    ),
                    CustomTextformAuth(
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      validator: (val) {
                        return validInput(val!, 10, 11, 'phone');
                      },
                      hintTxt: '26'.tr,
                      labelTxt: '27'.tr,
                      myController: controller.PhoneController,
                      isPassword: false,
                    ),
                    CustomTextformAuth(
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        return validInput(val!, 8, 30, 'password');
                      },
                      hintTxt: '24'.tr,
                      labelTxt: '25'.tr,
                      myController: controller.passwordController,
                    ),
                    const SizedBox(height: 24),
                    CustomButtonAuth(
                      title: '19'.tr,
                      onPressed: () {
                        controller.signUp();
                      },
                    ),
                    const SizedBox(height: 24),
                    CustomTextSignUpOrSignin(
                      textOne: '28'.tr,
                      textTwo: '4'.tr,
                      onPressed: () {
                        controller.goToSignIn();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
