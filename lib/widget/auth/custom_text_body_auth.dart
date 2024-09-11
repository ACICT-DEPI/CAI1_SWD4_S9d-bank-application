import 'package:flutter/material.dart';

class CustomTextBodyAuth extends StatelessWidget {
  const CustomTextBodyAuth({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}
