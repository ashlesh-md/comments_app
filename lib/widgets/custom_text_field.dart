import 'package:flutter/material.dart';

/// The `CustomTextField` class is a customizable text field widget in Dart for Flutter applications.
class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool isObscure;
  final String? Function(String?)? validator;
  final double borderRadius;

  const CustomTextField({
    required this.label,
    required this.controller,
    this.isObscure = false,
    this.validator,
    this.borderRadius = 10,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
    );
  }
}
