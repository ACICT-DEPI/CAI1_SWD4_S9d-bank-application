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
        title: Text('104'.tr),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            controller.goToTransferScreen();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
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
                  '105'.tr,
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
                  '106'.tr,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                CustomTextformAuth(
                    hintTxt: controller.isSelectPhone ? '26'.tr : '20'.tr,
                    labelTxt: controller.isSelectPhone ? '27'.tr : '21'.tr,
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
                  '107'.tr,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                CustomTextformAuth(
                    hintTxt: controller.isSelectPhone ? '26'.tr : '20'.tr,
                    labelTxt: controller.isSelectPhone ? '27'.tr : '21'.tr,
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
                  '61'.tr,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                CustomTextformAuth(
                    hintTxt: '108'.tr,
                    labelTxt: '67'.tr,
                    myController: controller.amountController,
                    validator: (val) {
                      return validInput(val!, 2, 7, 'amount');
                    },
                    keyboardType: TextInputType.number),
                Text(
                  '109'.tr,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                CustomTextformAuth(
                    hintTxt: '110'.tr,
                    labelTxt: '111'.tr,
                    myController: controller.contentController,
                    validator: (val) {
                      return validInput(val!, 5, 300, 'content');
                    },
                    keyboardType: TextInputType.text),
                SizedBox(
                  height: 40,
                ),
                CustomButtonAuth(
                    title: '77'.tr,
                    onPressed: () {
                      controller.goToSuccessTransferScreen();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
