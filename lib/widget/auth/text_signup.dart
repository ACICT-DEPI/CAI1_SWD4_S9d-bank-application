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
    return Padding(
      padding: const EdgeInsets.only(left: 85, right: 55.5, top: 5),
      child: Row(
        children: [
          Text(
            textOne,
            style: const TextStyle(
              color: AppColor.grey,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextButton(
            onPressed: () {
              onPressed();
            },
            child: Text(
              textTwo,
              style: const TextStyle(
                  color: AppColor.primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
