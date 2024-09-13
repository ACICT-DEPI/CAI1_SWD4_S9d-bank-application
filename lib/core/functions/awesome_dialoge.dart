import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';

showAwesomeDialog(BuildContext context,
    {required String title,
    required String desc,
    required void Function() onOk,
    void Function()? onCancel, // Made onCancel optional
    required DialogType dialogType}) {
  AwesomeDialog(
    context: context,
    dialogType: dialogType,
    animType: AnimType.rightSlide,
    title: title,
    desc: desc,
    btnCancelOnPress: onCancel != null
        ? () {
            FocusScope.of(context).unfocus();
            onCancel();
          }
        : null,
    btnOkOnPress: () {
      FocusScope.of(context).unfocus();
      onOk();
    },
  ).show();
}
