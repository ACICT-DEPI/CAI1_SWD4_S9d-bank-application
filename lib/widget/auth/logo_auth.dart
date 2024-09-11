import 'package:flutter/material.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key, required this.imageAsset});
  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageAsset,
      height: 170,
    );
  }
}
