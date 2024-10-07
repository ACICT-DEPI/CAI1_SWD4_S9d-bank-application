import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vaulta/core/services/sevices.dart';

import '../constant/routes.dart';
import '../functions/awesome_dialoge.dart';

abstract class BillController extends GetxController {
  String getTodayDate();
  String getAfterMonthDate();
  goToSuccessPayment(String userName, String type, String content);
}

class BillControllerImpl extends BillController {
  late User user;
  late DateTime todayDate;
  late DateTime afterMonthDate;
  late MyServices myServices;

  // Reactive variables
  var username = ''.obs;
  var phoneNumber = ''.obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final DateFormat dateFormat = DateFormat('dd/MM/yyyy');

  @override
  String getTodayDate() {
    return dateFormat.format(todayDate);
  }

  @override
  String getAfterMonthDate() {
    return dateFormat.format(afterMonthDate);
  }

  @override
  goToSuccessPayment(String userName, String type, String content) async {
    try {
      var userId = myServices.sharedPreferences.getString('userid');
      var userDoc = await firestore.collection('users').doc(userId).get();

      if (userDoc['username'] == userName) {
        var balance = userDoc['balance'];
        if (balance > 60) {
          await firestore
              .collection('users')
              .doc(userId)
              .update({'balance': balance - 60});
          await firestore.collection('transactions').add({
            'amount': 60,
            'timestamp': DateTime.now(),
            'from': userDoc['username'],
            'to': type,
            'content': content,
          });
          showAwesomeDialog(Get.context!,
              title: 'Success',
              desc: 'Your payment has been successful', onOk: () {
            Get.offAllNamed(AppRoute.successPaymentScreen);
          }, dialogType: DialogType.success);
        } else {
          showAwesomeDialog(Get.context!,
              title: 'Insufficient balance',
              desc: 'Your balance is not enough to pay the bill', onOk: () {
            Get.back();
          }, dialogType: DialogType.error);
        }
      } else {
        showAwesomeDialog(Get.context!,
            title: 'Wrong username',
            desc: 'Check your username and try again', onOk: () {
          Get.back();
        }, dialogType: DialogType.error);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getUserData() async {
    try {
      final userDoc = await firestore.collection('users').doc(user.uid).get();
      if (userDoc.exists) {
        username.value = userDoc['username'];
        phoneNumber.value = userDoc['phone'];
      } else {
        throw 'User not found';
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    user = FirebaseAuth.instance.currentUser!;
    todayDate = DateTime.now();
    afterMonthDate = todayDate.add(const Duration(days: 30));

    await getUserData();
    myServices = Get.find();
  }
}
