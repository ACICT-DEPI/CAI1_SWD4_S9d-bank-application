import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaulta/widget/custom_loading_dialog.dart';

void showLoading(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: 80, vertical: 24),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 400), // Set maximum width
          child: Container(
            // padding: const EdgeInsets.all(),
            child: CustomLoadingDialog(),
          ),
        ),
      );
    },
  );
}

void hideLoading(BuildContext context) {
  Get.back();
}
