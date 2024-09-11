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
    if (myServices.sharedPreferences.getString('onboarding') == '1') {
      return RouteSettings(name: AppRoute.login);
    }
  }
}
