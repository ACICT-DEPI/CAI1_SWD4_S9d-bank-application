import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/constant/routes.dart';
import '../core/services/sevices.dart';

class MyMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    // Check if the user has completed onboarding
    if (myServices.sharedPreferences.getString('onboarding') != '1') {
      // New user, redirect to the language selection screen
      return RouteSettings(name: AppRoute.language);
    }

    // Check Firebase auth state
    User? user = FirebaseAuth.instance.currentUser;

    if (myServices.sharedPreferences.getString('userid') != null) {
      // User is signed in, go to home
      print('your id is ${myServices.sharedPreferences.getString('userid')}');
      return RouteSettings(name: AppRoute.home);
    } else {
      // User is not signed in, go to login
      return RouteSettings(name: AppRoute.login);
    }
  }
}
