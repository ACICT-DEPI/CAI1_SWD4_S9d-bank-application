import 'package:flutter/material.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key, required this.imageAsset});
  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 81,
        right: 81,
        top: 32,
      ),
      child: Image(
        image: AssetImage(imageAsset),
      ),
    );
  }
}
