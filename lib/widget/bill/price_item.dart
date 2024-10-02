import 'package:flutter/material.dart';

class PriceItem extends StatelessWidget {
  const PriceItem(
      {super.key,
      required this.label,
      required this.price,
      required this.color});
  final String label;
  final String price;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF979797),
          ),
        ),
        Text(
          price,
          style: TextStyle(
            fontSize: 16,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
