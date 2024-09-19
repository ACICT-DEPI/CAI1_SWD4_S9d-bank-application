import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vaulta/core/constant/routes.dart';
import 'package:vaulta/core/services/sevices.dart';

abstract class ConfirmTransactionController extends GetxController {
  goToTransferScreen();
  goToSuccessTransferScreen();
}

class ConfirmTransactionControllerImpl extends ConfirmTransactionController {
  late TextEditingController fromController;
  late TextEditingController toController;
  late TextEditingController amountController;
  late TextEditingController contentController;
  late GlobalKey<FormState> formKey;
  late bool isChecked;
  late bool isSelectPhone;
  late bool isSelectUsername;
  MyServices myServices = Get.find();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  goToTransferScreen() {
    Get.back();
  }

  @override
  void onInit() {
    super.onInit();
    fromController = TextEditingController();
    toController = TextEditingController();
    amountController = TextEditingController();
    contentController = TextEditingController();
    formKey = GlobalKey<FormState>();
    isChecked = Get.arguments['isChecked'] ?? false;
    isSelectPhone = Get.arguments['isSelectPhone'];
    isSelectUsername = !isSelectPhone;

    // Populate the controllers with data from the transfer screen
    toController.text = Get.arguments['tousername'] ?? '';
    fromController.text = Get.arguments['fromusername'] ?? '';
    amountController.text = Get.arguments['amount'] ?? '';
    contentController.text = Get.arguments['content'] ?? '';
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    fromController.dispose();
    toController.dispose();
    amountController.dispose();
    contentController.dispose();
  }

  @override
  goToSuccessTransferScreen() async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      try {
        // Check if the user ID is available in shared preferences
        final fromId = myServices.sharedPreferences.getString('userid');
        if (fromId == null) {
          print('Error: User ID not found in SharedPreferences');
          return;
        }

        // Fetch the `fromUser` document
        final fromUserDoc =
            await firestore.collection('users').doc(fromId).get();
        if (!fromUserDoc.exists) {
          print('Error: Sender not found');
          return;
        }
        late QuerySnapshot<Map<String, dynamic>> toUserQuerySnapshot;
        // Fetch the `toUser` document based on the username
        if (isSelectPhone) {
          toUserQuerySnapshot = await firestore
              .collection('users')
              .where('phone', isEqualTo: toController.text)
              .get();
        } else {
          toUserQuerySnapshot = await firestore
              .collection('users')
              .where('username', isEqualTo: toController.text)
              .get();
        }
        if (toUserQuerySnapshot.docs.isEmpty) {
          print('Error: Recipient not found');
          return;
        }

        if (toUserQuerySnapshot.docs.isEmpty) {
          print('Error: Recipient not found');
          return;
        }

        final toUserDoc = toUserQuerySnapshot.docs[0];

        // Parse the transfer amount
        final int? transferAmount = int.tryParse(amountController.text);
        if (transferAmount == null) {
          print('Error: Invalid transfer amount');
          return;
        }

        // Fetch the balances
        int fromUserBalance = fromUserDoc['balance'];
        int toUserBalance = toUserDoc['balance'];

        // Ensure `fromUser` has enough balance for the transfer
        if (fromUserBalance < transferAmount) {
          print('Error: Insufficient funds');
          return;
        }

        // Update the balances
        fromUserBalance -= transferAmount;
        toUserBalance += transferAmount;

        // Update `fromUser` balance in Firestore
        await firestore
            .collection('users')
            .doc(fromId)
            .update({'balance': fromUserBalance});

        // Update `toUser` balance in Firestore
        await firestore
            .collection('users')
            .doc(toUserDoc.id)
            .update({'balance': toUserBalance});

        // Add the transaction record (Firestore will create the collection automatically if it doesn't exist)
        await firestore.collection('transactions').add({
          'from': fromUserDoc['username'],
          'to': toUserDoc['username'],
          'amount': transferAmount,
          'content': contentController.text,
          'timestamp': FieldValue.serverTimestamp(),
        });

        if (isChecked) {
          firestore.collection('recents').add({
            'phone': toUserDoc['phone'],
            'to': toUserDoc['uid'],
            'username': toUserDoc['username'],
            'fromid': fromUserDoc['uid'],
          });
        }

        // Navigate to the success screen
        Get.offAllNamed(AppRoute.successTransfer, arguments: {
          'to': toUserDoc['username'],
          'amount': transferAmount,
        });
      } catch (e) {
        print('Error: $e');
      }
    } else {
      print('Error: Form validation failed');
    }
  }
}
