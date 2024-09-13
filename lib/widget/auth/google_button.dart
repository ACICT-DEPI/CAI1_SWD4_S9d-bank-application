import 'package:flutter/material.dart';
import 'package:vaulta/core/constant/imageAssets.dart';

class GoogleLoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GoogleLoginButton({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Text above the circular button
        const Text(
          'You can also login with',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 20),
        // Circular button with Google icon
        InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(50), // For ripple effect
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Image.asset(
              AppImageassets.googleIcon, // Replace with your Google icon asset
              height: 40,
              width: 40,
            ),
          ),
        ),
      ],
    );
  }
}
