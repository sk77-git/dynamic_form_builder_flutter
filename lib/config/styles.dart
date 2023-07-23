import 'package:flutter/material.dart';

class Styles {
  static TextStyle get titleStyle {
    return const TextStyle(
        fontSize: 16.5, fontWeight: FontWeight.bold, color: Colors.black);
  }

  static TextStyle get subtitleStyle {
    return const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black87);
  }

  static TextStyle get headingStyle {
    return const TextStyle(
        fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black);
  }

  static TextStyle get defaultTextStyle {
    return const TextStyle();
  }

  static BoxDecoration boxDecoration() {
    return BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 2,
        blurRadius: 2,
        offset: const Offset(0, 0),
      ),
    ], borderRadius: BorderRadius.circular(10));
  }
}
