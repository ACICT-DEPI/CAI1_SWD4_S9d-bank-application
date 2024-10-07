import 'package:get/get.dart';
import 'package:vaulta/core/constant/routes.dart';

abstract class SuccessPaymentController extends GetxController {
  goToHome();
}

class SuccessPaymentControllerImpl extends SuccessPaymentController {
  @override
  goToHome() {
    Get.offAllNamed(AppRoute.homePage);
  }
}
