import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../data/data_source/static/static.dart';
import '../../controller/onboarding_controller.dart';

class CustomSliderOnBoarding extends GetView<OnboardingControllerImpl> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (index) {
        controller.onPageChanged(index);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                onBoardingList[index].image!,
                height: Get.width / 1.3,
                fit: BoxFit.fill,
              ),
              SizedBox(height: 40),
              Text(
                onBoardingList[index].title!,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: AppColor.black,
                ),
              ),
              SizedBox(height: 20),
              Text(
                onBoardingList[index].body!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1.5,
                  color: AppColor.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
