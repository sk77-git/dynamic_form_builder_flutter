import 'package:flutter/material.dart';

class Decorations {
  static InputDecoration inputDecoration(Widget? suffixIcon, String? hint) {
    return InputDecoration(
      suffixIcon: suffixIcon,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      filled: true,
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.black87),
      suffixIconColor: Colors.black87,
      labelStyle: const TextStyle(color: Colors.black54),
    );
  }
}
