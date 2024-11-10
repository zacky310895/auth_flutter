// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomtextField extends StatelessWidget {
  const CustomtextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.prefixIcon,
    this.suffixIcon,
    this.onPressed,
    this.obscureText = false,
  });
  final String hintText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController controller;
  final VoidCallback? onPressed;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          suffixIcon:
              GestureDetector(onTap: onPressed, child: Icon(suffixIcon)),
          prefixIcon: Icon(prefixIcon)),
    );
  }
}
