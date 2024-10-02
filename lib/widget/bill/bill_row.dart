import 'package:flutter/material.dart';

class BillRow extends StatelessWidget {
  const BillRow({super.key, required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
                color: Color(0xFF979797),
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          Text(value,
              style: TextStyle(
                  color: Color(0xFF343434),
                  fontSize: 16,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
