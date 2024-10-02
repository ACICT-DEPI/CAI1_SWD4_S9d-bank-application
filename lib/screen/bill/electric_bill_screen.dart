import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaulta/controller/bill/electric_bill_controller.dart';
import 'package:vaulta/core/constant/color.dart';
import 'package:vaulta/core/functions/valid_input.dart';
import 'package:vaulta/widget/auth/custom_button_auth.dart';
import 'package:vaulta/widget/auth/custom_textFormAuth.dart';
import 'package:vaulta/widget/bill/bill_row.dart';
import 'package:vaulta/widget/bill/dashed_divider.dart';
import 'package:vaulta/widget/bill/price_item.dart';

class ElectricBillScreen extends StatelessWidget {
  const ElectricBillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ElectricBillControllerImpl controller =
        Get.put(ElectricBillControllerImpl());
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Electric Bill'),
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
                  margin: EdgeInsets.symmetric(horizontal: 18),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
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
                        'All the Bills',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(height: 20),
                      const BillRow(label: 'Name', value: 'Ahmed Salah'),
                      const SizedBox(height: 16),
                      const BillRow(
                          label: 'Phone number', value: '01553161624'),
                      const SizedBox(height: 16),
                      const BillRow(label: 'Code', value: '123456789'),
                      const SizedBox(height: 16),
                      const BillRow(label: 'From', value: '1/1/2021'),
                      const SizedBox(height: 16),
                      const BillRow(label: 'To', value: '1/2/2021'),
                      const SizedBox(height: 16),
                      PriceItem(
                          label: 'Electric fee',
                          price: '\$50',
                          color: AppColor.primaryColor),
                      const SizedBox(height: 12),
                      DashedDivider(),
                      const SizedBox(height: 16),
                      PriceItem(
                          label: 'Tax',
                          price: '\$10',
                          color: AppColor.primaryColor),
                      SizedBox(height: 12),
                      DashedDivider(),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'TOTAL',
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
            SizedBox(height: 32),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: CustomTextformAuth(
                  hintTxt: 'Enter your username',
                  labelTxt: 'Username',
                  myController: controller.usernameController,
                  validator: (val) {
                    validInput(val!, 6, 30, 'username');
                  },
                  keyboardType: TextInputType.text),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0), // Add some padding
              child: CustomButtonAuth(
                title: 'Pay the bill',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
