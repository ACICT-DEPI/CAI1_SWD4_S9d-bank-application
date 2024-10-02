import 'package:get/get.dart';
import 'package:vaulta/data/model/bill_model.dart';

import '../../../core/constant/imageAssets.dart';
import '../../model/onboardingmodel.dart';

List<OnboardingModel> onBoardingList = [
  OnboardingModel(
      title: "8".tr, body: "9".tr, image: AppImageassets.onboardingImageOne),
  OnboardingModel(
      title: "10".tr, body: "11".tr, image: AppImageassets.onboardingImageTwo),
  OnboardingModel(
      title: "12".tr,
      body: "13".tr,
      image: AppImageassets.onboardingImageThree),
];
List<BillModel> billList = [
  BillModel(
    title: 'Electric bill',
    body: 'Pay electric bill this month',
    image: AppImageassets.electricImage,
  ),
  BillModel(
    title: 'Water bill',
    body: 'Pay water bill this month',
    image: AppImageassets.waterImage,
  ),
  BillModel(
    title: 'Mobile bill',
    body: 'Pay mobile bill this month',
    image: AppImageassets.mobileImage,
  ),
  BillModel(
    title: 'Internet bill',
    body: 'Pay internet bill this month',
    image: AppImageassets.internetImage,
  ),
];
