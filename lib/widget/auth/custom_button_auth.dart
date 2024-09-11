import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomButtonAuth extends StatelessWidget {
  const CustomButtonAuth(
      {super.key, required this.title, required this.onPressed});
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: AppColor.primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 15),
          elevation: 5,
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
