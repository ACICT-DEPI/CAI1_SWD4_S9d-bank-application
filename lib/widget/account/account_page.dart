import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:get/get.dart';
import 'package:vaulta/controller/account_page_controller.dart';

import '../../core/constant/color.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    AccountPageControllerImp controller = Get.put(AccountPageControllerImp());
    TextEditingController amountController = TextEditingController();

    Future<String?> addBalancePopUp() => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              "75".tr,
              style: const TextStyle(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: TextFormField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "75".tr,
                prefixIcon:
                    Icon(Icons.monetization_on, color: AppColor.primaryColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: AppColor.primaryColor),
                ),
              ),
            ),
            actions: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColor.primaryColor,
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(amountController.text);
                    amountController.clear();
                  },
                  child: Text(
                    "77".tr,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        );

    return FocusDetector(
      onFocusGained: controller.onReady,
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(25),
              child: Center(
                child: Obx(() {
                  return Column(
                    children: [
                      controller.profilePic.value.isNotEmpty
                          ? CircleAvatar(
                              radius: 60,
                              backgroundImage:
                                  NetworkImage(controller.profilePic.value),
                            )
                          : CircleAvatar(
                              radius: 60,
                              child: Text(
                                controller.username.value.isNotEmpty
                                    ? controller.username.value[0]
                                    : "",
                                style: TextStyle(
                                  fontSize: 50,
                                  color: AppColor.primaryColor,
                                ),
                              ),
                            ),
                      Text(
                        controller.username.value.isNotEmpty
                            ? controller.username.value
                            : "",
                        style: TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Obx(() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        '78'.tr,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Text(
                        controller.accountNumber.value.isNotEmpty
                            ? "${controller.accountNumber.value.substring(0, 4)} ${controller.accountNumber.value.substring(4, 8)} ${controller.accountNumber.value.substring(8)}"
                            : "",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        '79'.tr,
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      trailing: Text(
                        "${controller.balance.value}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3629B7),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton(
                  onPressed: () async {
                    String? amountAdded = await addBalancePopUp();
                    controller.validateAmount(amountAdded ?? "");
                    controller.onReady();
                  },
                  child: Text(
                    "75".tr,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
