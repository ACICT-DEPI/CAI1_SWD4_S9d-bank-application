import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaulta/controller/withdraw/withdraw_controller.dart';
import 'package:vaulta/core/constant/imageAssets.dart';
import 'package:vaulta/core/functions/valid_input.dart';
import 'package:vaulta/widget/withdraw_amount_item.dart';

class WithdrawScreen extends StatelessWidget {
  const WithdrawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WithdrawControllerImpl controller = Get.put(WithdrawControllerImpl());

    return Scaffold(
      appBar: AppBar(
        title: Text('Withdraw', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            controller.goToHome();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image or illustration at the top
                Center(
                  child: Image.asset(
                    AppImageassets.withdraw,
                    width: 320,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 40),

                // Dropdown for selecting card
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Select method',
                    labelStyle: TextStyle(fontSize: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                  ),
                  value: 'Username',
                  onChanged: (String? newValue) {
                    controller.selectTransaction(newValue!);
                  },
                  items: ['Username', 'Phone Number']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: TextStyle(fontSize: 16)),
                    );
                  }).toList(),
                ),
                SizedBox(height: 24),

                // Phone number or username input
                GetBuilder<WithdrawControllerImpl>(builder: (context) {
                  return TextFormField(
                    decoration: InputDecoration(
                      labelText: controller.isSelectPhone
                          ? 'Enter phone number'
                          : 'Enter username',
                      labelStyle: TextStyle(fontSize: 18),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                    keyboardType: controller.isSelectPhone
                        ? TextInputType.phone
                        : TextInputType.text,
                    validator: (val) {
                      if (controller.isSelectPhone) {
                        return validInput(val!, 10, 11, 'phone');
                      }
                      return validInput(val!, 3, 20, 'username');
                    },
                    controller: controller.isSelectPhone
                        ? controller.phoneController
                        : controller.usernameController,
                  );
                }),
                SizedBox(height: 24),

                // Amount selection
                GetBuilder<WithdrawControllerImpl>(builder: (context) {
                  return controller.selectedAmount == 'Other'
                      ? TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Enter amount',
                            labelStyle: TextStyle(fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            filled: true,
                            fillColor: Colors.grey[100],
                          ),
                          validator: (val) {
                            return validInput(val!, 3, 7, 'Amount');
                          },
                          controller: controller.amountController,
                          keyboardType: TextInputType.number,
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Choose amount',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 10),
                            Center(child: Obx(() {
                              return Wrap(
                                spacing: 16,
                                runSpacing: 16,
                                children: [
                                  WithdrawAmountItem(
                                    amount: '\$10',
                                    selected: controller.selectedAmount == '10',
                                    onTap: () => controller.selectAmount('10'),
                                  ),
                                  WithdrawAmountItem(
                                    amount: '\$50',
                                    selected: controller.selectedAmount == '50',
                                    onTap: () => controller.selectAmount('50'),
                                  ),
                                  WithdrawAmountItem(
                                    amount: '\$100',
                                    selected:
                                        controller.selectedAmount == '100',
                                    onTap: () => controller.selectAmount('100'),
                                  ),
                                  WithdrawAmountItem(
                                    amount: '\$150',
                                    selected:
                                        controller.selectedAmount == '150',
                                    onTap: () => controller.selectAmount('150'),
                                  ),
                                  WithdrawAmountItem(
                                    amount: '\$200',
                                    selected:
                                        controller.selectedAmount == '200',
                                    onTap: () => controller.selectAmount('200'),
                                  ),
                                  WithdrawAmountItem(
                                    amount: 'Other',
                                    selected:
                                        controller.selectedAmount == 'Other',
                                    onTap: () =>
                                        controller.selectAmount('Other'),
                                  ),
                                ],
                              );
                            })),
                          ],
                        );
                }),

                SizedBox(height: 30),

                // Verify button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(16),
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      controller.goToSuccess();
                    },
                    child: Text(
                      'Verify',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
