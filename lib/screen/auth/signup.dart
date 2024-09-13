import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaulta/widget/auth/logo_auth.dart';

import '../../../core/constant/color.dart';
import '../../controller/auth/signup_controller.dart';
import '../../core/constant/imageAssets.dart';
import '../../core/functions/awesome_dialoge.dart';
import '../../core/functions/valid_input.dart';
import '../../widget/auth/custom_button_auth.dart';
import '../../widget/auth/custom_textFormAuth.dart';
import '../../widget/auth/custom_text_body_auth.dart';
import '../../widget/auth/custom_text_title_auth.dart';
import '../../widget/auth/text_signup.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SignupControllerImpl controller = Get.put(SignupControllerImpl());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '19'.tr,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: AppColor.grey,
                  fontWeight: FontWeight.bold,
                ),
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppColor.backgroundColor,
        ),
        body: WillPopScope(
          onWillPop: () => showAwesomeDialog(context,
              title: 'Exit',
              desc: 'Are you sure you want to go out.',
              onOk: () {
                exit(0);
              },
              dialogType: DialogType.warning,
              onCancel: () {
                Get.back();
              }),
          child: Container(
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
                          CustomTextTitleAuth(title: '5'.tr),
                          LogoAuth(imageAsset: AppImageassets.signup),
                          const SizedBox(height: 10),
                          CustomTextBodyAuth(title: '6'.tr),
                          const SizedBox(height: 30),
                          CustomTextformAuth(
                            keyboardType: TextInputType.text,
                            validator: (val) {
                              return validInput(val!, 6, 30, 'username');
                            },
                            hintTxt: '20'.tr,
                            icon: Icons.person_outline,
                            labelTxt: '21'.tr,
                            myController: controller.usernameController,
                          ),
                          CustomTextformAuth(
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              return validInput(val!, 6, 100, 'email');
                            },
                            hintTxt: '22'.tr,
                            icon: Icons.email_outlined,
                            labelTxt: '23'.tr,
                            myController: controller.emailController,
                          ),
                          CustomTextformAuth(
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            validator: (val) {
                              return validInput(val!, 10, 11, 'phone');
                            },
                            hintTxt: '26'.tr,
                            icon: Icons.phone_android_outlined,
                            labelTxt: '27'.tr,
                            myController: controller.PhoneController,
                          ),
                          CustomTextformAuth(
                            keyboardType: TextInputType.text,
                            validator: (val) {
                              return validInput(val!, 8, 30, 'password');
                            },
                            hintTxt: '24'.tr,
                            icon: Icons.lock_outline,
                            labelTxt: '25'.tr,
                            myController: controller.passwordController,
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomButtonAuth(
                    title: '19'.tr,
                    onPressed: () {
                      controller.signUp();
                    },
                  ),
                  const SizedBox(height: 30),
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
        ));
  }
}
