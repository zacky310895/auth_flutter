import 'package:flutter/material.dart';

class CustomcheckBox extends StatelessWidget {
  const CustomcheckBox({
    super.key, 
    required this.value, 
    required this.onChanged});
  final bool value;
  final void Function(bool? val) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: value, onChanged: onChanged),
        const Text('Remember me')
      ],
    );
  }
}