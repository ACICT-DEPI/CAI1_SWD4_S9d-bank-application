import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:vaulta/core/constant/routes.dart';
import 'package:vaulta/core/services/sevices.dart';

abstract class TransactionReportController extends GetxController {
  getTransactionReport();
  goToHome();
}

class TransactionReportControllerImpl extends TransactionReportController {
  var transactionList = [].obs;
  List<Map<String, dynamic>> transactions = [];

  MyServices myServices = Get.find();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late String currentUsername;

  @override
  getTransactionReport() async {
    var userId = myServices.sharedPreferences.getString('userid') ?? '';

    if (userId.isEmpty) {
      return;
    }

    // Fetch the user's username
    var userDoc = await firestore.collection('users').doc(userId).get();
    currentUsername = userDoc['username'];

    if (currentUsername.isEmpty) {
      return;
    }

    // Listen to both outgoing (sent) and incoming (received) transactions in real-time
    firestore
        .collection('transactions')
        .where('from', isEqualTo: currentUsername)
        .snapshots()
        .listen((fromQuerySnapshot) {
      List<Map<String, dynamic>> allTransactions = [];

      fromQuerySnapshot.docs.forEach((doc) {
        allTransactions.add({
          ...doc.data(),
          'status': 'sent',
        });
      });

      // Fetch transactions where the user is the recipient
      firestore
          .collection('transactions')
          .where('to', isEqualTo: currentUsername)
          .snapshots()
          .listen((toQuerySnapshot) {
        toQuerySnapshot.docs.forEach((doc) {
          allTransactions.add({
            ...doc.data(),
            'status': 'received',
          });
        });

        allTransactions.sort((a, b) {
          Timestamp timestampA = a['timestamp'] as Timestamp;
          Timestamp timestampB = b['timestamp'] as Timestamp;
          return timestampB.compareTo(timestampA); // Reverse the order
        });
        // Update the transaction list
        transactionList.assignAll(allTransactions);
      });
    });
  }

  // Function to get the display name based on whether the user is sender or receiver
  String getDisplayUsername(Map<String, dynamic> transaction) {
    if (transaction['status'] == 'sent') {
      return transaction['to'] ?? 'Unknown';
    } else {
      return transaction['from'] ?? 'Unknown';
    }
  }

  @override
  void onInit() {
    super.onInit();
    getTransactionReport(); // Set up real-time listeners on init
  }

  @override
  goToHome() {
    Get.offAllNamed(AppRoute.homePage);
  }
}
