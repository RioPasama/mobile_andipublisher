import 'package:flutter/material.dart';

TextFormField textFromFiled({
  required TextEditingController controller,
  required String labelText,
  required Icon prefixIcon,
  TextInputAction textInputAction = TextInputAction.next,
  TextInputType? keyboardType,
  bool obscureText = false,
  Widget? suffixIcon,
  required Function(String?) validator,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    obscureText: obscureText,
    textInputAction: textInputAction,
    decoration: InputDecoration(
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      hintStyle: TextStyle(color: Colors.grey.shade600),
      fillColor: Colors.white70,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(),
      ),
      labelText: labelText,
      labelStyle: TextStyle(fontSize: 14, color: Colors.grey.shade600),
    ),
    validator: (value) => validator(value),
  );
}
