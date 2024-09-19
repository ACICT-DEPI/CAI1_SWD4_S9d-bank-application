import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:vaulta/core/services/sevices.dart';

import '../core/constant/routes.dart';

abstract class HomeController extends GetxController {
  signOut();
  goToTransferScreen();
}

class HomeControllerImpl extends HomeController {
  MyServices myServices = Get.find();
  @override
  signOut() async {
    await FirebaseAuth.instance.signOut();
    myServices.sharedPreferences.remove('userid');
    Get.offNamed(AppRoute.login);
  }

  @override
  goToTransferScreen() {
    Get.offNamed(AppRoute.transfer);
  }
}
