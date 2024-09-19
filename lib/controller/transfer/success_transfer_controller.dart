import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class SuccessTransferController extends GetxController {
  goToHomeScreen();
}

class SuccessTransferControllerImpl extends SuccessTransferController {
  late String toUsername;
  late int amount;
  @override
  goToHomeScreen() {
    Get.offAllNamed(AppRoute.homePage);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    toUsername = Get.arguments['to'] ?? '';
    amount = Get.arguments['amount'] ?? '';
  }
}
