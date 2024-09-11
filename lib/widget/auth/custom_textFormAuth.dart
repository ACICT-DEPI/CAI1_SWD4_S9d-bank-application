import 'package:flutter/material.dart';

class CustomTextformAuth extends StatelessWidget {
  const CustomTextformAuth({
    super.key,
    required this.hintTxt,
    required this.icon,
    required this.labelTxt,
    required this.myController,
    required this.validator,
    required this.keyboardType,
    this.obscureText,
    this.onTapIcon,
  });
  final String hintTxt;
  final IconData icon;
  final String labelTxt;
  final TextEditingController myController;
  final String? Function(String?) validator;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final void Function()? onTapIcon;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: TextFormField(
          obscureText:
              obscureText == null || obscureText == false ? false : true,
          validator: validator,
          keyboardType: keyboardType,
          controller: myController,
          decoration: InputDecoration(
            hintText: hintTxt,
            hintStyle: const TextStyle(fontSize: 16),
            label: Text(
              labelTxt,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            suffixIcon: InkWell(
              child: Icon(icon),
              onTap: onTapIcon,
            ),
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          ),
        ),
      ),
    );
  }
}
