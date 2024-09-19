import 'package:flutter/material.dart';

class CustomTextformAuth extends StatefulWidget {
  const CustomTextformAuth({
    super.key,
    required this.hintTxt,
    this.icon,
    required this.labelTxt,
    required this.myController,
    required this.validator,
    required this.keyboardType,
    this.obscureText,
    this.onTapIcon,
    this.isPassword,
  });

  final String hintTxt;
  final IconData? icon;
  final String labelTxt;
  final TextEditingController myController;
  final String? Function(String?) validator;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final void Function()? onTapIcon;
  final bool? isPassword;

  @override
  _CustomTextformAuthState createState() => _CustomTextformAuthState();
}

class _CustomTextformAuthState extends State<CustomTextformAuth> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {}); // Rebuild when the focus state changes
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextFormField(
          focusNode: _focusNode,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
            hintText: widget.hintTxt,
            labelText: widget.labelTxt,
            labelStyle: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w600),
            hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
            suffixIcon: _focusNode.hasFocus && widget.isPassword == true
                ? InkWell(
                    child: Icon(
                      widget.obscureText == true
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onTap: widget.onTapIcon,
                  )
                : null,
            border: InputBorder.none,
          ),
          keyboardType: widget.keyboardType,
          controller: widget.myController,
          validator: widget.validator,
          obscureText: widget.obscureText == null || widget.obscureText == false
              ? false
              : true,
        ),
      ),
    );
  }
}
