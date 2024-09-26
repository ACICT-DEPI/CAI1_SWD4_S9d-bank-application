import 'package:flutter/material.dart';

import '../../core/constant/imageAssets.dart';

class VisaImage extends StatelessWidget {
  const VisaImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage(AppImageassets.visaImage),
      height: 300, // Increase the height of the Visa image
      width: double.infinity,
      fit: BoxFit.contain,
    );
  }
}
