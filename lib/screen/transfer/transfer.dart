import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaulta/core/constant/color.dart';
import 'package:vaulta/core/functions/valid_input.dart';
import 'package:vaulta/widget/auth/custom_button_auth.dart';
import 'package:vaulta/widget/auth/custom_textFormAuth.dart';
import 'package:vaulta/widget/transfer/add_recent_transaction.dart';
import 'package:vaulta/widget/transfer/container_transactions.dart';
import 'package:vaulta/widget/transfer/resent_transaction.dart';

import '../../controller/transfer/transfer_controller.dart';
import '../../widget/add_user_recent_dialoge.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TransferControllerImpl controller = Get.put(TransferControllerImpl());
    return Scaffold(
      appBar: AppBar(
        title: Text('71'.tr),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            controller.goToHome();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '117'.tr,
                style: TextStyle(
                  fontSize: 18,
                  color: AppColor.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              GetBuilder<TransferControllerImpl>(builder: (context) {
                return Row(
                  children: [
                    ContainerTransactions(
                      title: '118'.tr,
                      icon: Icons.person,
                      onTap: () {
                        controller.selectTransaction('username');
                      },
                      isSelect: controller.isSelectUsername,
                    ),
                    SizedBox(width: 16),
                    ContainerTransactions(
                      title: '119'.tr,
                      icon: Icons.phone,
                      onTap: () {
                        controller.selectTransaction('phone');
                      },
                      isSelect: controller.isSelectPhone,
                    ),
                  ],
                );
              }),
              SizedBox(
                height: 12,
              ),
              Text(
                '120'.tr,
                style: TextStyle(
                  fontSize: 18,
                  color: AppColor.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  GetBuilder<TransferControllerImpl>(builder: (context) {
                    return AddRecentTransaction(
                      onTap: () {
                        // Open the dialog to add a new user
                        showDialog(
                          context: Get.context!,
                          builder: (context) {
                            return AddUserDialog(
                                isPhone: controller.isSelectPhone);
                          },
                        );
                      },
                    );
                  }), // Enhanced design for Add button
                  const SizedBox(width: 12),
                  Expanded(
                    child: SizedBox(
                      height: 160,
                      child: GetBuilder<TransferControllerImpl>(
                        builder: (controller) {
                          if (controller.recentTransactions.isEmpty) {
                            return Center(
                              child: Text("121".tr),
                            );
                          }
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.recentTransactions.length,
                            itemBuilder: (context, index) {
                              final transaction =
                                  controller.recentTransactions[index].data();
                              return RecentTransaction(
                                username: transaction['username'] ?? 'U',
                                phone: transaction['phone'] ?? '',
                                onTap: () {
                                  // Fill the text fields with the transaction details
                                  controller.phoneController.text =
                                      transaction['phone'];
                                  controller.usernameController.text =
                                      transaction['username'];
                                  print(
                                      'Transaction selected: ${transaction['username']}');
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    GetBuilder<TransferControllerImpl>(builder: (context) {
                      return CustomTextformAuth(
                          hintTxt: controller.isSelectPhone ? '64'.tr : '65'.tr,
                          labelTxt:
                              controller.isSelectPhone ? '27'.tr : '21'.tr,
                          myController: controller.isSelectPhone
                              ? controller.phoneController
                              : controller.usernameController,
                          validator: (val) {
                            return validInput(
                                val!,
                                7,
                                30,
                                controller.isSelectPhone
                                    ? 'phone'
                                    : 'username');
                          },
                          keyboardType: controller.isSelectPhone
                              ? TextInputType.phone
                              : TextInputType.text);
                    }),
                    SizedBox(
                      height: 12,
                    ),
                    CustomTextformAuth(
                        hintTxt: '108'.tr,
                        labelTxt: '76'.tr,
                        myController: controller.amountController,
                        validator: (val) {
                          return validInput(val!, 2, 7, 'amount');
                        },
                        keyboardType: TextInputType.number),
                    SizedBox(
                      height: 12,
                    ),
                    CustomTextformAuth(
                        hintTxt: '110'.tr,
                        labelTxt: '111'.tr,
                        myController: controller.contentController,
                        validator: (val) {
                          return validInput(val!, 10, 1000, 'content');
                        },
                        keyboardType: TextInputType.text),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GetBuilder<TransferControllerImpl>(builder: (context) {
                    return Transform.scale(
                      scale: 1.2,
                      child: Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        checkColor: Colors.white,
                        activeColor: AppColor.primaryColor,
                        value: controller.isChecked,
                        onChanged: (value) {
                          controller.changeCheckbox(value!);
                        },
                      ),
                    );
                  }),
                  SizedBox(width: 12),
                  Text(
                    '122'.tr,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              CustomButtonAuth(
                  title: '77'.tr,
                  onPressed: () {
                    controller.goToConfirmTransaction();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
