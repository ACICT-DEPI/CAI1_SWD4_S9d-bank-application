import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomTextSignUpOrSignin extends StatelessWidget {
  const CustomTextSignUpOrSignin(
      {super.key,
      required this.textOne,
      required this.textTwo,
      required this.onPressed});
  final String textOne;
  final String textTwo;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textOne,
          style: TextStyle(
            color: AppColor.grey,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            textTwo,
            style: TextStyle(
              color: AppColor.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
