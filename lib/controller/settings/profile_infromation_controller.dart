import 'package:get/get.dart';
import 'package:vaulta/core/constant/routes.dart';

abstract class ProfileInfromationController extends GetxController {
  goToEditProfile();
}

class ProfileInfromationControllerImpl extends ProfileInfromationController {
  @override
  goToEditProfile() {
    Get.toNamed(AppRoute.editProfileScreen);
  }
}
