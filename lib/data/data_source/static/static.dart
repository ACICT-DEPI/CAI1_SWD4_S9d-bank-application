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
    title: '123'.tr,
    body: '140'.tr,
    image: AppImageassets.electricImage,
  ),
  BillModel(
    title: '144'.tr,
    body: '141'.tr,
    image: AppImageassets.waterImage,
  ),
  BillModel(
    title: '145'.tr,
    body: '142'.tr,
    image: AppImageassets.mobileImage,
  ),
  BillModel(
    title: '146'.tr,
    body: '143'.tr,
    image: AppImageassets.internetImage,
  ),
];
