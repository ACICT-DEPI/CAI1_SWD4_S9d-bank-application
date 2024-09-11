import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../controller/auth/login_controller.dart';
import '../../core/constant/imageAssets.dart';
import '../../core/functions/alert_exit_app.dart';
import '../../core/functions/valid_input.dart';
import '../../widget/auth/custom_button_auth.dart';
import '../../widget/auth/custom_textFormAuth.dart';
import '../../widget/auth/custom_text_body_auth.dart';
import '../../widget/auth/custom_text_title_auth.dart';
import '../../widget/auth/logo_auth.dart';
import '../../widget/auth/text_signup.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LogInControllerImpl controller = Get.put(LogInControllerImpl());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '4'.tr,
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
        onWillPop: alertExitApp,
        child: Container(
          color: AppColor.backgroundColor,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Form(
            key: controller.formKey,
            child: ListView(
              children: [
                const LogoAuth(
                  imageAsset: AppImageassets.login,
                ),
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
                        const SizedBox(height: 10),
                        CustomTextBodyAuth(title: '6'.tr),
                        const SizedBox(height: 30),
                        CustomTextformAuth(
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) {
                            return validInput(val!, 5, 100, 'email');
                          },
                          hintTxt: '22'.tr,
                          icon: Icons.email_outlined,
                          labelTxt: '23'.tr,
                          myController: controller.emailController,
                        ),
                        GetBuilder<LogInControllerImpl>(builder: (controller) {
                          return CustomTextformAuth(
                            onTapIcon: controller.showPassword,
                            obscureText: controller.isShowPassword,
                            keyboardType: TextInputType.text,
                            validator: (val) {
                              return validInput(val!, 7, 30, 'password');
                            },
                            hintTxt: '24'.tr,
                            icon: Icons.lock_outline,
                            labelTxt: '25'.tr,
                            myController: controller.passwordController,
                          );
                        }),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            controller.goToForgetPassword();
                          },
                          child: Text(
                            '29'.tr,
                            style: TextStyle(
                              color: AppColor.grey,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                CustomButtonAuth(
                  title: '4'.tr,
                  onPressed: () {
                    controller.logIn();
                  },
                ),
                const SizedBox(height: 30),
                CustomTextSignUpOrSignin(
                  textOne: '30'.tr,
                  textTwo: '19'.tr,
                  onPressed: () {
                    controller.goToSignUp();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
