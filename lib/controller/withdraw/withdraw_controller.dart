import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaulta/core/functions/awesome_dialoge.dart';
import 'package:vaulta/core/services/sevices.dart';

import '../../core/constant/routes.dart';

abstract class WithdrawController extends GetxController {
  goToHome();
  selectAmount(String amount);
  String get selectedAmount;
  selectTransaction(String type);
  goToSuccess();
}

class WithdrawControllerImpl extends WithdrawController {
  var _selectedAmount = ''.obs;
  late bool isSelectPhone;
  late bool isSelectUsername;
  late MyServices services;
  late TextEditingController phoneController;
  late TextEditingController usernameController;
  late TextEditingController amountController;
  late GlobalKey<FormState> formKey;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  goToHome() {
    Get.offAllNamed(AppRoute.homePage);
  }

  @override
  selectAmount(String amount) {
    _selectedAmount.value = amount; // Update the selected amount
  }

  @override
  String get selectedAmount =>
      _selectedAmount.value; // Return the selected amount
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isSelectPhone = false;
    isSelectUsername = true;
    services = Get.find<MyServices>();
    phoneController = TextEditingController();
    usernameController = TextEditingController();
    amountController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    phoneController.dispose();
    usernameController.dispose();
    amountController.dispose();
  }

  @override
  selectTransaction(String? type) {
    if (type == 'Phone Number') {
      isSelectPhone = true;
      isSelectUsername = false;
    } else if (type == 'Username') {
      isSelectPhone = false;
      isSelectUsername = true;
    }
    update();
  }

  @override
  goToSuccess() async {
    var curentUserId = services.sharedPreferences.getString('userid');
    if (formKey.currentState!.validate()) {
      var userDoc = await firestore.collection('users').doc(curentUserId).get();
      var userBalance = userDoc['balance'];
      print(userBalance);
      if (isSelectPhone) {
        if (phoneController.text != userDoc['phone']) {
          showAwesomeDialog(Get.context!, title: '161'.tr, desc: '171'.tr,
              onOk: () {
            Get.back();
          }, dialogType: DialogType.error);
          return;
        }
      } else {
        if (usernameController.text != userDoc['username']) {
          showAwesomeDialog(Get.context!, title: '159'.tr, desc: '172'.tr,
              onOk: () {
            Get.back();
          }, dialogType: DialogType.error);
          return;
        }
      }
      if (selectedAmount == 'Other') {
        var amount = int.parse(amountController.text);
        if (amount > userBalance) {
          showAwesomeDialog(Get.context!, title: '151'.tr, desc: '173'.tr,
              onOk: () {
            Get.back();
          }, dialogType: DialogType.error);
        } else {
          var newBalance = userBalance - amount;
          await firestore
              .collection('users')
              .doc(curentUserId)
              .update({'balance': newBalance});
          update();

          Get.offAllNamed(AppRoute.successWithdrawScreen);
        }
      } else {
        selectedAmount.replaceAll('\$', '');
        var amount = int.parse(selectedAmount);
        if (amount > userBalance) {
          showAwesomeDialog(Get.context!, title: '151'.tr, desc: '173'.tr,
              onOk: () {
            Get.back();
          }, dialogType: DialogType.error);
        } else {
          var newBalance = userBalance - amount;
          await firestore
              .collection('users')
              .doc(curentUserId)
              .update({'balance': newBalance});
          update();
          Get.offAllNamed(AppRoute.successWithdrawScreen);
        }
      }
    } else {
      showAwesomeDialog(Get.context!, title: '174'.tr, desc: '175'.tr,
          onOk: () {
        Get.back();
      }, dialogType: DialogType.error);
    }
  }
}
