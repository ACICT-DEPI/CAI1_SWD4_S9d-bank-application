import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class ResetPasswordController extends GetxController {
  void resetPassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImpl extends ResetPasswordController {
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;
  late GlobalKey<FormState> formKey;
  @override
  void resetPassword() {}

  @override
  goToSuccessResetPassword() {
    var formData = formKey.currentState;
    if (formData!.validate()) {
      print('goToSuccessResetPassword');
      Get.offNamed(AppRoute.successResetPassword);
    } else {
      print('not goToSuccessResetPassword');
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
  }
}
