import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/transaction_report_controller.dart';

class TransactionReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TransactionReportControllerImpl controller =
        Get.put(TransactionReportControllerImpl());

    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction Report'),
      ),
      body: Column(
        children: [
          // Expanded(
          //   child: Obx(() => ListView.builder(
          //         itemCount: controller.transactionList.length,
          //         itemBuilder: (context, index) {
          //           final transaction = controller.transactionList[index];
          //           return ListTile(
          //             title: Text(transaction['toUsername'] ?? 'Unknown'),
          //             subtitle: Text(transaction['amount'].toString()),
          //             trailing: Text(transaction['status'] ?? ''),
          //             leading: Column(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Text(transaction['date']
          //                     .toString()), // Format date if needed
          //               ],
          //             ),
          //           );
          //         },
          //       )),
          // ),
        ],
      ),
    );
  }
}
