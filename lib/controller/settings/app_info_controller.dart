import 'package:get/get.dart';

abstract class AppInfoController extends GetxController {
  goToSettings();
}

class AppInfoControllerImpl extends AppInfoController {
  @override
  goToSettings() {
    Get.back();
  }
}
