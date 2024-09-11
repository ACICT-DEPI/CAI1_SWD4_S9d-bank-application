import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onboarding_controller.dart';
import '../../../data/data_source/static/static.dart';
import '../../core/constant/color.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingControllerImpl>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onBoardingList.length,
                (index) => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.only(right: 8),
                  height: 8,
                  width: controller.currentPage == index ? 24 : 8,
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ));
  }
}
