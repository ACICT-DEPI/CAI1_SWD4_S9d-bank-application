import 'package:get/get.dart';

abstract class EditProfileController extends GetxController {
  gotToProfileInformation();
}

class EditProfileControllerImpl extends EditProfileController {
  @override
  gotToProfileInformation() {
    Get.back();
  }
}
