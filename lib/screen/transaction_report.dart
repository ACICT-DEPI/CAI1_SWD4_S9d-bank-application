import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // Import intl package for date formatting
import 'package:vaulta/core/constant/color.dart';
import 'package:vaulta/widget/report_item.dart';

import '../controller/transaction_report_controller.dart';
import '../core/constant/imageAssets.dart';

class TransactionReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TransactionReportControllerImpl controller =
        Get.put(TransactionReportControllerImpl());
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          title: Row(
            children: [
              IconButton(
                onPressed: () {
                  controller.goToHome();
                },
                icon: const Icon(Icons.arrow_back_ios),
                color: Colors.white,
              ),
              Text(
                "Transaction Report",
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        body: Stack(alignment: Alignment.topCenter, children: [
          Container(
            color: AppColor.primaryColor,
            width: screenSize.width,
            height: screenSize.height,
            child: Padding(
              padding: EdgeInsets.only(top: screenSize.height * .15),
              child: Container(
                padding: EdgeInsets.only(top: screenSize.height * .2),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                height: screenSize.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // Wrap ListView with Expanded to provide bounded height
                    Expanded(
                      child: Obx(() {
                        // Remove the controller.getTransactionReport() call here
                        return ListView.separated(
                          shrinkWrap: true, // Shrink to fit available height
                          itemCount: controller.transactionList.length,
                          itemBuilder: (context, index) {
                            final transactionReport =
                                controller.transactionList[index];

                            // Use the controller method to get the correct username to display
                            String displayName = controller
                                .getDisplayUsername(transactionReport);
                            String amount =
                                transactionReport['amount'].toString();
                            String content =
                                transactionReport['content'] ?? 'No details';
                            bool isReceived =
                                transactionReport['status'] == 'received';

                            // Get the timestamp and format it to only day, month, and time
                            Timestamp timestamp =
                                transactionReport['timestamp'];
                            DateTime dateTime = timestamp.toDate();
                            String formattedDate = DateFormat('dd MMM, hh:mm a')
                                .format(
                                    dateTime); // Format date to "day month, time"

                            return ReportItem(
                              toName: displayName,
                              amount: amount,
                              content: content,
                              isReceived: isReceived,
                              date: formattedDate, // Pass formatted date here
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 5),
                        );
                      }),
                    )
                  ],
                ),
              ),
            ),
          ),
          const Image(image: AssetImage(AppImageassets.visaImage)),
        ]));
  }
}
