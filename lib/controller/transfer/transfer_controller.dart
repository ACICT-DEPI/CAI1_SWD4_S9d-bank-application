import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vaulta/core/functions/awesome_dialoge.dart';
import 'package:vaulta/core/functions/show_loading.dart';

import '../../core/constant/routes.dart';

abstract class TransferController extends GetxController {
  goToHome();
  selectTransaction(String type);
  changeCheckbox(bool value);
  goToConfirmTransaction();
  void fetchRecentTransactions();
}

class TransferControllerImpl extends TransferController {
  late bool isSelectPhone;
  late bool isSelectUsername;
  late TextEditingController phoneController;
  late TextEditingController usernameController;
  late GlobalKey<FormState> formKey;
  late TextEditingController amountController;
  late TextEditingController contentController;
  late bool isChecked;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // A list to store the recent transactions
  var recentTransactions = [].obs;
  @override
  goToHome() {
    Get.offNamed(AppRoute.homePage);
  }

  @override
  selectTransaction(String type) {
    if (type == 'phone') {
      isSelectPhone = true;
      isSelectUsername = false;
    } else {
      isSelectPhone = false;
      isSelectUsername = true;
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    isSelectPhone = false;
    isSelectUsername = true;
    phoneController = TextEditingController();
    usernameController = TextEditingController();
    formKey = GlobalKey<FormState>();
    amountController = TextEditingController();
    contentController = TextEditingController();
    isChecked = false;
    fetchRecentTransactions();
  }

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
    usernameController.dispose();
    amountController.dispose();
    contentController.dispose();
  }

  @override
  changeCheckbox(bool value) {
    isChecked = value;
    update();
  }

  @override
  goToConfirmTransaction() async {
    try {
      showLoading(Get.context!);

      // Validate the form
      if (formKey.currentState!.validate()) {
        final sharedPreferences = Get.find<SharedPreferences>();

        // Get the current user by ID from sharedPreferences
        final userId = sharedPreferences.getString('userid');
        if (userId == null) {
          hideLoading(Get.context!);
          throw Exception('User ID not found in shared preferences');
        }

        // Fetch the current user document from Firestore
        final userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .get();

        // Check if balance is enough
        if (int.parse(amountController.text) > userDoc['balance']) {
          hideLoading(Get.context!);
          showAwesomeDialog(Get.context!,
              title: 'Balance',
              desc: 'Your balance isn\'t enough to complete the transaction',
              onOk: () {
            Get.back();
          }, dialogType: DialogType.error);
          return;
        }

        QuerySnapshot<Map<String, dynamic>> receiverSnapshot;

        // Search for the receiver based on the transaction type
        if (isSelectPhone) {
          receiverSnapshot = await FirebaseFirestore.instance
              .collection('users')
              .where('phone', isEqualTo: phoneController.text)
              .get();
        } else {
          receiverSnapshot = await FirebaseFirestore.instance
              .collection('users')
              .where('username', isEqualTo: usernameController.text)
              .get();
        }

        // Check if the receiver exists
        if (receiverSnapshot.docs.isEmpty) {
          hideLoading(Get.context!);
          showAwesomeDialog(Get.context!,
              title: 'Error', desc: 'The user not found', onOk: () {
            Get.back();
          }, dialogType: DialogType.error);
          return;
        }
        if (receiverSnapshot.docs.first['uid'] == userId) {
          hideLoading(Get.context!);
          showAwesomeDialog(Get.context!,
              title: 'Error',
              desc: 'You can\'t transfer to yourself', onOk: () {
            Get.back();
          }, dialogType: DialogType.error);
          return;
        }
        if (isChecked) {
          final resentQuerySnapshot = await FirebaseFirestore.instance
              .collection('recents')
              .where('fromid', isEqualTo: userId)
              .where('to', isEqualTo: receiverSnapshot.docs.first['uid'])
              .get();

          if (resentQuerySnapshot.docs.isNotEmpty) {
            hideLoading(Get.context!);
            showAwesomeDialog(Get.context!,
                title: 'User Found',
                desc: 'You can\'t add a user who already exists in the list',
                onOk: () {
              Get.back();
            }, dialogType: DialogType.error);
            return;
          }
        }

        // Navigate to the confirmation page with transaction details
        hideLoading(Get.context!);
        Get.toNamed(AppRoute.confirmTransfer, arguments: {
          'isSelectPhone': isSelectPhone,
          'phone': phoneController.text,
          'tousername': isSelectPhone
              ? receiverSnapshot.docs.first['phone']
              : usernameController.text,
          'fromusername':
              isSelectPhone ? userDoc['phone'] : userDoc['username'],
          'amount': amountController.text,
          'content': contentController.text,
          'isChecked': isChecked
        });
      }
    } catch (e) {
      hideLoading(Get.context!);
      print('Error: $e');
      showAwesomeDialog(Get.context!,
          title: 'Error', desc: 'An unexpected error occurred', onOk: () {
        Get.back();
      }, dialogType: DialogType.error);
    }
  }

  @override
  void fetchRecentTransactions() async {
    try {
      final sharedPreferences = Get.find<SharedPreferences>();
      final userId = sharedPreferences.getString('userid');
      if (userId == null) {
        hideLoading(Get.context!);
        throw Exception('User ID not found in SharedPreferences');
      }

      final resentTransactionsGet = await _firestore
          .collection('recents')
          .where('fromid', isEqualTo: userId)
          .get();

      recentTransactions.value = resentTransactionsGet.docs;
      update();
    } catch (e) {
      print('Error fetching recent transactions: $e');
      Get.snackbar("Error", "Failed to load recent transactions");
    }
  }
}
