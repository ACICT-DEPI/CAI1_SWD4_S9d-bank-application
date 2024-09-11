import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class SignupController extends GetxController {
  void signUp();
  goToSignIn();
}

class SignupControllerImpl extends SignupController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController usernameController;
  late TextEditingController PhoneController;
  late GlobalKey<FormState> formKey;
  @override
  void signUp() {
    var formData = formKey.currentState;
    if (formData!.validate()) {
      print('signUp');
      Get.offNamed(AppRoute.verifyCodeSignUp);
    } else {
      print('not signUp');
    }
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    usernameController = TextEditingController();
    PhoneController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    PhoneController.dispose();
  }
}
