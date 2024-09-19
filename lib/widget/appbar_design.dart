import 'package:flutter/material.dart';
import 'package:vaulta/core/constant/color.dart';

class AppbarDesign extends StatelessWidget {
  const AppbarDesign({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(90),
      child: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.arrow_back_ios),
            Text(
              title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
