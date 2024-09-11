import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onboarding_controller.dart';
import '../../../core/constant/color.dart';

class CustomButtonOnBoarding extends GetView<OnboardingControllerImpl> {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 80),
        onPressed: () {
          controller.next();
        },
        color: AppColor.primaryColor,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          "14".tr,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
    ;
  }
}
