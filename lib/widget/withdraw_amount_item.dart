import 'package:flutter/material.dart';

import '../core/constant/color.dart';

class WithdrawAmountItem extends StatelessWidget {
  const WithdrawAmountItem({
    super.key,
    required this.amount,
    required this.selected,
    required this.onTap,
  });

  final String amount;
  final bool selected;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 60,
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: selected ? AppColor.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            amount,
            style: TextStyle(
              fontSize: 16,
              color: selected ? Colors.white : AppColor.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
