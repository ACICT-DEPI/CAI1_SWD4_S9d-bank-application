import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class SettingsController extends GetxController {
  gotToProfileInformation();
  goToLanguage();
  goToAppInfo();
}

class SettingsControllerImpl extends SettingsController {
  @override
  goToAppInfo() {
    Get.toNamed(AppRoute.appInfoScreen);
  }

  @override
  goToLanguage() {
    Get.toNamed(AppRoute.languageProfileScreen);
  }

  @override
  gotToProfileInformation() {
    Get.toNamed(AppRoute.profileInfromationScreen);
  }
}
