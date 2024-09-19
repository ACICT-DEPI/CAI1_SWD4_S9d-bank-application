import 'package:flutter/material.dart';

import '../../core/constant/color.dart';

class CustomTextTitleAuth extends StatelessWidget {
  const CustomTextTitleAuth({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          color: AppColor.primaryColor,
          fontSize: 24,
          fontWeight: FontWeight.w600),
    );
  }
}
