import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:vaulta/core/services/sevices.dart';

abstract class TransactionReportController extends GetxController {
  getTransactionReport();
}

class TransactionReportControllerImpl extends TransactionReportController {
  var toUsernames;
  var content;
  var status;
  var timestamp;
  var amount;

  var transactionList = [].obs;
  List<Map<String, dynamic>> transactions = [];

  MyServices myServices = Get.find();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  getTransactionReport() async {
    var userId = myServices.sharedPreferences.getString('userid') ?? '';

    // Early return if the user ID is empty
    if (userId.isEmpty) {
      return;
    }

    // Fetch the user's username
    var userDoc = await firestore.collection('users').doc(userId).get();
    var username = userDoc['username'];

    if (username.isEmpty) {
      return;
    }

    // Fetch transactions where the user is the sender
    var fromQuery = await firestore
        .collection('transactions')
        .where('from', isEqualTo: username)
        .get();
    print("Outgoing Transactions: ${fromQuery.docs.length}");

    // Fetch transactions where the user is the recipient
    var toQuery = await firestore
        .collection('transactions')
        .where('to', isEqualTo: username)
        .get();
    print("Incoming Transactions: ${toQuery.docs.length}");

    List<Map<String, dynamic>> allTransactions = [];

    // Add outgoing transactions with status "sent"
    fromQuery.docs.forEach((doc) {
      allTransactions.add({
        ...doc.data(),
        'status': 'sent',
      });
    });

    // Add incoming transactions with status "received"
    toQuery.docs.forEach((doc) {
      allTransactions.add({
        ...doc.data(),
        'status': 'received',
      });
    });

    // Sort by 'timestamp'
    allTransactions.sort((a, b) {
      Timestamp timestampA = a['timestamp'] as Timestamp;
      Timestamp timestampB = b['timestamp'] as Timestamp;
      return timestampA.compareTo(timestampB);
    });

    transactionList.clear();
    transactionList.addAll(allTransactions);
    print("All Transactions: ${transactionList[0]}");
  }

  @override
  void onInit() {
    super.onInit();
    getTransactionReport();
  }
}
