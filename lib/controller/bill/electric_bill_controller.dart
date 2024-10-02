import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ElectricBillController extends GetxController {
  goToBillScreen();
}

class ElectricBillControllerImpl extends ElectricBillController {
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
  dispose() {
    super.dispose();
    usernameController.dispose();
  }
}
