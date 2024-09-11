import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class SuccessResetPasswordController extends GetxController {
  void goToLogin();
}

class SuccessResetPasswordControllerImpl
    extends SuccessResetPasswordController {
  @override
  void goToLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
