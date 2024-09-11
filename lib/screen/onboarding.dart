import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/onboarding_controller.dart';
import '../core/constant/color.dart';
import '../widget/onboarding/custom_button.dart';
import '../widget/onboarding/dot_controller.dart';
import '../widget/onboarding/slider.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingControllerImpl());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: CustomSliderOnBoarding(),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  CustomDotControllerOnBoarding(),
                  Spacer(),
                  CustomButtonOnBoarding(),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
