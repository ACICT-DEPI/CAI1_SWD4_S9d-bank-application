import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaulta/controller/bill/bill_screen_controller.dart';
import 'package:vaulta/data/data_source/static/static.dart';
import 'package:vaulta/widget/bill/bill_list_item.dart';

class BillScreen extends StatelessWidget {
  const BillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BillScreenControllerImpl controller = Get.put(BillScreenControllerImpl());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pay the bill'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            controller.goToHomeScreen();
          },
        ),
      ),
      body: Expanded(
        child: ListView.builder(
          itemCount: billList.length,
          itemBuilder: (context, index) {
            return BillListItem(
              billModel: billList[index],
              onTap: () {
                controller.goToBillDetailScreen(billList[index].title);
              },
            );
          },
        ),
      ),
    );
  }
}
