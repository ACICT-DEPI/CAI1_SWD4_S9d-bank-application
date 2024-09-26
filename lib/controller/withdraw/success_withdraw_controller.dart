import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class SuccessWithdrawController extends GetxController {
  goToHome();
}

class SuccessWithdrawControllerImpl extends SuccessWithdrawController {
  @override
  goToHome() {
    Get.offAllNamed(AppRoute.homePage);
  }
}
