import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaulta/core/functions/valid_input.dart';
import 'package:vaulta/widget/auth/custom_button_auth.dart';
import 'package:vaulta/widget/auth/custom_textFormAuth.dart';

import '../controller/transfer/add_user_recent_controller.dart';

class AddUserDialog extends StatelessWidget {
  final bool isPhone;
  AddUserDialog({required this.isPhone});

  @override
  Widget build(BuildContext context) {
    AddUserRecentControllerImpl controller =
        Get.put(AddUserRecentControllerImpl());
    return AlertDialog(
      title: Text('63'.tr),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          isPhone
              ? CustomTextformAuth(
                  hintTxt: '64'.tr,
                  labelTxt: '27'.tr,
                  myController: controller.addUserController,
                  validator: (val) {
                    return validInput(val!, 10, 11, 'phone');
                  },
                  keyboardType: TextInputType.phone)
              : CustomTextformAuth(
                  hintTxt: '65'.tr,
                  labelTxt: '21'.tr,
                  myController: controller.addUserController,
                  validator: (val) {
                    validInput(val!, 10, 30, 'username');
                    return null;
                  },
                  keyboardType: TextInputType.text),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            // Close the dialog without saving
            Navigator.of(context).pop();
          },
          child: Text("67".tr),
        ),
        CustomButtonAuth(
            title: '66'.tr,
            onPressed: () {
              controller.addUser(isPhone);
            }),
      ],
    );
  }
}
