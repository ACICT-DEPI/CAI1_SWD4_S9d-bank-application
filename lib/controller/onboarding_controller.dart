import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/constant/routes.dart';
import '../core/services/sevices.dart';
import '../data/data_source/static/static.dart';

abstract class OnboardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnboardingControllerImpl extends OnboardingController {
  late PageController pageController;
  int currentPage = 0;
  MyServices myServices = Get.find();
  @override
  next() {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      myServices.sharedPreferences.setString('onboarding', '1');
      Get.offAllNamed(AppRoute.login);
    } else {
      pageController.animateToPage(currentPage,
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    pageController = PageController();
  }
}
