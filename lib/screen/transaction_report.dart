import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaulta/core/constant/color.dart';

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
                  // Navigator.pushReplacementNamed(context, HomeScreen.routeName);
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
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) => buildItems(),
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 5,
                              ),
                          itemCount: 20),
                    )
                  ],
                ),
              ),
            ),
          ),
          const Image(image: AssetImage(AppImageassets.visaImage)),
        ]));
  }

  Widget buildItems() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: Colors.grey[50],
        child: Row(
          children: [
            Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                width: 50,
                height: 50,
                child: Image(
                  image: AssetImage(AppImageassets.transactionReportItemImage),
                  fit: BoxFit.fill,
                )),
            const SizedBox(
              width: 20,
            ),
            const Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "user name",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "12/3/2024",
                    style: TextStyle(fontSize: 15, color: Colors.red),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            const Text(
              "Amount",
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.green),
            )
          ],
        ),
      ),
    );
  }
}
