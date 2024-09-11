import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class SuccessSignupController extends GetxController {
  void goToLogin();
}

class SuccessSignupControllerImpl extends SuccessSignupController {
  @override
  void goToLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
