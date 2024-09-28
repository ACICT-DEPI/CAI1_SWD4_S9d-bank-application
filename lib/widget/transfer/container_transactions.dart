import 'package:flutter/material.dart';

import '../../core/constant/color.dart';

class ContainerTransactions extends StatelessWidget {
  const ContainerTransactions({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.isSelect,
  });
  final String title;
  final IconData icon;
  final void Function() onTap;
  final bool isSelect;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 140,
          height: 140,
          decoration: BoxDecoration(
            color: isSelect
                ? AppColor.primaryColor.withOpacity(0.8)
                : AppColor
                    .containerGreyColor, // Use primary color with some opacity
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                spreadRadius: 2,
                offset: Offset(0, 4), // Shadow with slight elevation
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 48, // Increased icon size
              ),
              SizedBox(height: 12), // More space between icon and text
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14, // Slightly increased font size
                  color: Colors.white,
                  fontWeight:
                      FontWeight.w600, // More emphasis on the text weight
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
