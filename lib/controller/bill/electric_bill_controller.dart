import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaulta/core/services/sevices.dart';

abstract class ElectricBillController extends GetxController {
  goToBillScreen();
  goToSuccessPayment();
}

class ElectricBillControllerImpl extends ElectricBillController {
  late TextEditingController usernameController;
  late MyServices myServices;
  late FirebaseFirestore firestore;
  @override
  goToBillScreen() {
    Get.back();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    usernameController = TextEditingController();
    myServices = Get.find();
    firestore = FirebaseFirestore.instance;
  }

  @override
  dispose() {
    super.dispose();
    usernameController.dispose();
  }

  @override
  goToSuccessPayment() async {}
}
