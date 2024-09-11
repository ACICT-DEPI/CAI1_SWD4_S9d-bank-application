import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class LogInController extends GetxController {
  void logIn();
  goToSignUp();
  goToForgetPassword();
}

class LogInControllerImpl extends LogInController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formKey;
  bool isShowPassword = true;

  showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  @override
  void logIn() {
    var form = formKey.currentState;
    if (form!.validate()) {
      print('login');
    } else {
      print('not login');
    }
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}
