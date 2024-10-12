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
                "60".tr,
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
                    Expanded(
                      child: Obx(() {
                        return ListView.separated(
                          shrinkWrap: true,
                          itemCount: controller.transactionList.length,
                          itemBuilder: (context, index) {
                            final transactionReport =
                                controller.transactionList[index];

                            String displayName = controller
                                .getDisplayUsername(transactionReport);
                            String amount =
                                transactionReport['amount'].toString();
                            String content =
                                transactionReport['content'] ?? 'No details';
                            bool isReceived =
                                transactionReport['status'] == 'received';

                            Timestamp timestamp =
                                transactionReport['timestamp'];
                            DateTime dateTime = timestamp.toDate();
                            String formattedDate =
                                DateFormat('dd MMM, hh:mm a').format(dateTime);

                            return ReportItem(
                              toName: displayName,
                              amount: amount,
                              content: content,
                              isReceived: isReceived,
                              date: formattedDate,
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
