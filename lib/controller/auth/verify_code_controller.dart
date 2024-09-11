import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class VerifyCodeController extends GetxController {
  void checkCode();
  goToResetPassword();
}

class VerifyCodeControllerImpl extends VerifyCodeController {
  late String verificationCode;

  @override
  void checkCode() {}

  @override
  goToResetPassword() {
    Get.offNamed(AppRoute.resetPassword);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
