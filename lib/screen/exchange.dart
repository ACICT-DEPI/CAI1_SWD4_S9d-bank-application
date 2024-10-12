import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaulta/core/constant/imageAssets.dart';
import 'package:vaulta/widget/auth/custom_button_auth.dart';

import '../controller/exchange_controller.dart';

class ExchangeScreen extends StatelessWidget {
  const ExchangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ExchangeControllerImpl controller = Get.put(ExchangeControllerImpl());

    return Scaffold(
      appBar: AppBar(
        title: Text("81".tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Illustration
            Container(
              height: 200,
              child: Center(
                child: Image.asset(AppImageassets.exchange,
                    width: 330, height: 215),
              ),
            ),
            SizedBox(height: 20),
            // Amount Input
            TextFormField(
              controller: controller.amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: '83'.tr,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.amountController.clear();
                  },
                  icon: Icon(Icons.clear_sharp),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Dropdown for currency selection
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("84".tr,
                    style: TextStyle(fontSize: 16, color: Colors.pinkAccent)),
                Obx(() => DropdownButton<String>(
                      value: controller.valueChoose.value.isEmpty
                          ? null
                          : controller.valueChoose.value,
                      items: ['86'.tr, '87'.tr, '88'.tr, '89'.tr, '90'.tr]
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        controller.valueChoose.value = value!;
                      },
                    )),
                GestureDetector(
                  onTap: () {}, // Add action for the image if needed
                  child: Image.asset(AppImageassets.arrow,
                      width: 100, height: 100),
                ),
                Text("85".tr,
                    style: TextStyle(fontSize: 16, color: Colors.pinkAccent)),
                Obx(() => DropdownButton<String>(
                      value: controller.valueChoose1.value.isEmpty
                          ? null
                          : controller.valueChoose1.value,
                      items: ['86'.tr, '87'.tr, '88'.tr, '89'.tr, '90'.tr]
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        controller.valueChoose1.value = value!;
                      },
                    )),
              ],
            ),
            SizedBox(height: 20),
            // Result Text Field
            TextField(
              controller: controller.resultController,
              decoration: InputDecoration(
                hintText: "91".tr,
                labelStyle: TextStyle(fontSize: 16, color: Colors.black),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 20),
            // Exchange Button
            Container(
              width: double.infinity,
              child: CustomButtonAuth(
                  title: '92'.tr,
                  onPressed: () {
                    controller.calculateExchange();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
