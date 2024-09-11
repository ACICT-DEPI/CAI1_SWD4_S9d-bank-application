import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class ForgetPasswordController extends GetxController {
  void checkEmail();
  goToVerifiedCode();
}

class ForgetPasswordControllerImpl extends ForgetPasswordController {
  late TextEditingController emailController;
  late GlobalKey<FormState> formKey;

  @override
  void checkEmail() {}

  @override
  goToVerifiedCode() {
    var formData = formKey.currentState;
    if (formData!.validate()) {
      print('goToVerifiedCode');
      Get.offNamed(AppRoute.verifiedCode);
    } else {
      print('not goToVerifiedCode');
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    emailController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
  }
}
