import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaulta/core/constant/color.dart';
import 'package:vaulta/core/functions/valid_input.dart';
import 'package:vaulta/widget/auth/custom_button_auth.dart';
import 'package:vaulta/widget/auth/custom_textFormAuth.dart';

import '../../controller/transfer/confirm_transaction_controller.dart';

class ConfirmTransactionScreen extends StatelessWidget {
  const ConfirmTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ConfirmTransactionControllerImpl controller =
        Get.put(ConfirmTransactionControllerImpl());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm Transaction'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            controller.goToTransferScreen();
          },
        ),
      ),
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24,
              ),
              Text(
                'Confirm transaction information',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColor.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'From:',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              CustomTextformAuth(
                  hintTxt: controller.isSelectPhone
                      ? 'please enter your phone'
                      : 'please enter your username',
                  labelTxt: controller.isSelectPhone ? 'Phone' : 'Username',
                  myController: controller.isSelectPhone
                      ? controller.fromController
                      : controller.fromController,
                  validator: (val) {
                    return validInput(val!, 7, 30,
                        controller.isSelectPhone ? 'phone' : 'username');
                  },
                  keyboardType: controller.isSelectPhone
                      ? TextInputType.phone
                      : TextInputType.text),
              SizedBox(
                height: 12,
              ),
              Text(
                'To:',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              CustomTextformAuth(
                  hintTxt: controller.isSelectPhone
                      ? 'please enter his phone'
                      : 'please enter his username',
                  labelTxt: controller.isSelectPhone ? 'Phone' : 'Username',
                  myController: controller.isSelectPhone
                      ? controller.toController
                      : controller.toController,
                  validator: (val) {
                    return validInput(val!, 7, 30,
                        controller.isSelectPhone ? 'phone' : 'username');
                  },
                  keyboardType: controller.isSelectPhone
                      ? TextInputType.phone
                      : TextInputType.text),
              Text(
                'Amount:',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              CustomTextformAuth(
                  hintTxt: 'please enter the amount',
                  labelTxt: 'Amount',
                  myController: controller.amountController,
                  validator: (val) {
                    return validInput(val!, 2, 7, 'amount');
                  },
                  keyboardType: TextInputType.number),
              const Text(
                'Content:',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              CustomTextformAuth(
                  hintTxt: 'please enter the content',
                  labelTxt: 'Content',
                  myController: controller.contentController,
                  validator: (val) {
                    return validInput(val!, 50, 1000, 'content');
                  },
                  keyboardType: TextInputType.text),
              SizedBox(
                height: 40,
              ),
              CustomButtonAuth(
                  title: 'Confirm',
                  onPressed: () {
                    controller.goToSuccessTransferScreen();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
