import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaulta/core/constant/imageAssets.dart';
import 'package:vaulta/core/functions/awesome_dialoge.dart';
import 'package:vaulta/widget/auth/logo_auth.dart';

import '../../../core/constant/color.dart';
import '../../controller/auth/login_controller.dart';
import '../../core/functions/valid_input.dart';
import '../../widget/auth/custom_button_auth.dart';
import '../../widget/auth/custom_textFormAuth.dart';
import '../../widget/auth/custom_text_body_auth.dart';
import '../../widget/auth/custom_text_title_auth.dart';
import '../../widget/auth/google_button.dart';
import '../../widget/auth/text_signup.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    LogInControllerImpl controller = Get.put(LogInControllerImpl());

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: AppBar(
          backgroundColor: AppColor.primaryColor,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 12,
                  left: 12,
                ),
                child: Text(
                  '4'.tr,
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: () => showAwesomeDialog(context,
            title: '135'.tr,
            desc: '134'.tr,
            onOk: () {
              exit(0);
            },
            dialogType: DialogType.warning,
            onCancel: () {
              Get.back();
            }),
        child: SingleChildScrollView(
          child: Container(
            color: AppColor.primaryColor,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(24),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  width: screenSize.width,
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 20),
                        CustomTextTitleAuth(title: '5'.tr),
                        const SizedBox(height: 8),
                        CustomTextBodyAuth(title: '47'.tr),
                        const SizedBox(height: 24),
                        LogoAuth(imageAsset: AppImageassets.login),
                        const SizedBox(height: 24),
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
                        GetBuilder<LogInControllerImpl>(builder: (controller) {
                          return CustomTextformAuth(
                            onTapIcon: controller.showPassword,
                            obscureText: controller.isShowPassword,
                            keyboardType: TextInputType.text,
                            validator: (val) {
                              return validInput(val!, 7, 30, 'password');
                            },
                            isPassword: true,
                            hintTxt: '24'.tr,
                            icon: Icons.lock_outline,
                            labelTxt: '25'.tr,
                            myController: controller.passwordController,
                          );
                        }),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                controller.goToForgetPassword();
                              },
                              child: Text(
                                '29'.tr,
                                style: const TextStyle(
                                  color: AppColor.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        CustomButtonAuth(
                          title: '4'.tr,
                          onPressed: () {
                            controller.logIn();
                          },
                        ),
                        const SizedBox(height: 16),
                        GoogleLoginButton(
                          onPressed: () {
                            controller.signInWithGoogle();
                          },
                        ),
                        const SizedBox(height: 16),
                        CustomTextSignUpOrSignin(
                          textOne: '30'.tr,
                          textTwo: '19'.tr,
                          onPressed: () {
                            controller.goToSignUp();
                          },
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
