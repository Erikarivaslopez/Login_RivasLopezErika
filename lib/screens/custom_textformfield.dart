import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final Function(String)? onChanged;
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.onChanged,
    required InputDecoration decoration,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: hintText,
        border: const OutlineInputBorder(),
      ),
      onChanged: onChanged,
    );
  }
}
