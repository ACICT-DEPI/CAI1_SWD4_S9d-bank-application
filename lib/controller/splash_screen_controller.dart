import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../core/constant/routes.dart';
import '../core/services/sevices.dart';

abstract class SplashScreenController extends GetxController {
  void navigateToNextScreen();
}

class SplashScreenControllerImpl extends SplashScreenController {
  MyServices myServices = Get.find();

  @override
  void onInit() {
    super.onInit();
    navigateToNextScreen(); // Start the navigation when the controller is initialized
  }

  @override
  void navigateToNextScreen() async {
    await Future.delayed(
        const Duration(seconds: 5)); // Show splash screen for 3 seconds
    User? user = FirebaseAuth.instance.currentUser;

    // Check if onboarding has been completed
    if (myServices.sharedPreferences.getString('onboarding') != '1') {
      Get.offAllNamed(AppRoute.language); // Navigate to the language screen
    } else if (user != null) {
      Get.offAllNamed(AppRoute.homePage); // User is logged in, go to home
    } else {
      Get.offAllNamed(AppRoute.login); // User is not logged in, go to login
    }
  }
}
