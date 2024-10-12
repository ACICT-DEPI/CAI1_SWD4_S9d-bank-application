import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/bill/water_bill_controller.dart';
import '../../core/constant/color.dart';
import '../../core/functions/valid_input.dart';
import '../../core/shared/bill_controller.dart';
import '../../widget/auth/custom_button_auth.dart';
import '../../widget/auth/custom_textFormAuth.dart';
import '../../widget/bill/bill_row.dart';
import '../../widget/bill/dashed_divider.dart';
import '../../widget/bill/price_item.dart';

class WaterBillScreen extends StatelessWidget {
  const WaterBillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WaterBillControllerImpl controller = Get.put(WaterBillControllerImpl());
    BillControllerImpl billController = Get.put(BillControllerImpl());
    return Scaffold(
      appBar: AppBar(
        title: Text('144'.tr),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            controller.goToBillScreen();
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 18),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '124'.tr,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      const SizedBox(height: 20),
                      Obx(() => BillRow(
                          label: '125'.tr,
                          value: billController.username.value)),
                      const SizedBox(height: 16),
                      Obx(() => BillRow(
                          label: '98'.tr,
                          value: billController.phoneNumber.value)),
                      const SizedBox(height: 16),
                      BillRow(label: '126'.tr, value: '123456789'),
                      const SizedBox(height: 16),
                      BillRow(
                          label: '84'.tr, value: billController.getTodayDate()),
                      const SizedBox(height: 16),
                      BillRow(
                          label: '85'.tr,
                          value: billController.getAfterMonthDate()),
                      const SizedBox(height: 16),
                      PriceItem(
                          label: '130'.tr,
                          price: '\$50',
                          color: AppColor.primaryColor),
                      const SizedBox(height: 12),
                      DashedDivider(),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '132'.tr,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$60',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: CustomTextformAuth(
                  hintTxt: '20'.tr,
                  labelTxt: '21'.tr,
                  myController: controller.usernameController,
                  validator: (val) {
                    return validInput(val!, 6, 30, 'username');
                  },
                  keyboardType: TextInputType.text),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0), // Add some padding
              child: CustomButtonAuth(
                title: '74'.tr,
                onPressed: () {
                  billController.goToSuccessPayment(
                      controller.usernameController.text,
                      'Water',
                      'Water bill payment');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
