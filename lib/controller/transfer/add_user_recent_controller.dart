import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaulta/controller/transfer/transfer_controller.dart';
import 'package:vaulta/core/functions/awesome_dialoge.dart';
import 'package:vaulta/core/services/sevices.dart';

abstract class AddUserRecentController extends GetxController {
  addUser(bool isPhone);
  goBack();
}

class AddUserRecentControllerImpl extends AddUserRecentController {
  late TextEditingController addUserController;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  MyServices myServices = Get.find();
  var userDoc;
  TransferControllerImpl transferController =
      Get.find<TransferControllerImpl>();
  @override
  addUser(bool isPhone) async {
    try {
      // Search for the user by phone or username
      if (isPhone) {
        userDoc = await FirebaseFirestore.instance
            .collection('users')
            .where('phone', isEqualTo: addUserController.text)
            .get();
      } else {
        userDoc = await FirebaseFirestore.instance
            .collection('users')
            .where('username', isEqualTo: addUserController.text)
            .get();
      }
      var userCheck;
      if (isPhone) {
        userCheck = await FirebaseFirestore.instance
            .collection('recents')
            .where('phone', isEqualTo: addUserController.text)
            .get();
      } else {
        userCheck = await FirebaseFirestore.instance
            .collection('recents')
            .where('username', isEqualTo: addUserController.text)
            .get();
      }
      if (userCheck.docs.isNotEmpty) {
        addUserController.clear();
        showAwesomeDialog(Get.context!, title: '176'.tr, desc: '177'.tr,
            onOk: () {
          Get.back();
        }, dialogType: DialogType.error);
        return;
      }
      // Check if the user exists
      if (userDoc.docs.isNotEmpty) {
        var user = userDoc.docs.first;

        // Add the user to the recents collection
        var resentData = {
          'fromid': myServices.sharedPreferences.getString('userid'),
          'to': user.id,
          'phone': user['phone'],
          'username': user['username'],
        };

        // Add to Firestore
        await FirebaseFirestore.instance.collection('recents').add(resentData);

        // Fetch the newly added document to ensure it's consistent with the list
        var resentDoc = await FirebaseFirestore.instance
            .collection('recents')
            .where('phone', isEqualTo: user['phone'])
            .get();

        // Add the first document snapshot to the recentTransactions list
        if (resentDoc.docs.isNotEmpty) {
          TransferControllerImpl transferController =
              Get.find<TransferControllerImpl>();
          transferController.recentTransactions
              .add(resentDoc.docs.first); // Add the document snapshot
          transferController.update();
        }

        // Clear the text field
        addUserController.clear();

        // Show success dialog
        showAwesomeDialog(Get.context!, title: '178'.tr, desc: '179'.tr,
            onOk: () {
          Get.back();
        }, dialogType: DialogType.success);
      } else {
        addUserController.clear();
        // User not found
        showAwesomeDialog(Get.context!, title: '180'.tr, desc: '181'.tr,
            onOk: () {
          Get.back();
        }, dialogType: DialogType.error);
      }
    } catch (e) {
      print('Error adding user: $e');
      Get.snackbar("Error", "Failed to add user");
    }
  }

  @override
  goBack() {
    Get.back();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    addUserController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    addUserController.dispose();
  }
}
