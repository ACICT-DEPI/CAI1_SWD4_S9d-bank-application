import 'package:get/get.dart';
import 'package:vaulta/core/constant/routes.dart';

abstract class BillScreenController extends GetxController {
  goToHomeScreen();
  goToBillDetailScreen(String billType);
}

class BillScreenControllerImpl extends BillScreenController {
  @override
  goToHomeScreen() {
    Get.offAllNamed(AppRoute.homePage);
  }

  @override
  goToBillDetailScreen(String billType) {
    if (billType == 'Electric bill') {
      Get.toNamed(AppRoute.electricBillScreen);
    } else if (billType == 'Internet bill') {
      Get.toNamed(AppRoute.internetBillScreen);
    } else if (billType == 'Mobile bill') {
      Get.toNamed(AppRoute.mobileBillScreen);
    } else if (billType == 'Water bill') {
      Get.toNamed(AppRoute.waterBillScreen);
    }
  }
}
