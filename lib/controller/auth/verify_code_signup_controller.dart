import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class VerifyCodeSignupController extends GetxController {
  void checkCode();
  goToSuccessSignUp();
}

class VerifyCodeSignupControllerImpl extends VerifyCodeSignupController {
  late String verificationCode;

  @override
  void checkCode() {}

  @override
  goToSuccessSignUp() {
    Get.offNamed(AppRoute.successSignUp);
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
