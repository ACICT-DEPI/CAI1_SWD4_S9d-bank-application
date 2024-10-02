import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class WaterBillController extends GetxController {
  goToBillScreen();
}

class WaterBillControllerImpl extends WaterBillController {
  late TextEditingController usernameController;
  @override
  goToBillScreen() {
    Get.back();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    usernameController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    usernameController.dispose();
  }
}
