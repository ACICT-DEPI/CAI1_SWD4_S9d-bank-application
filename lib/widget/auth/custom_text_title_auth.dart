import 'package:flutter/material.dart';

class CustomTextTitleAuth extends StatelessWidget {
  const CustomTextTitleAuth({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
    );
  }
}
