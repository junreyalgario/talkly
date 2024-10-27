import 'package:flutter/material.dart';

class ButtonCustomStyles {
  static ButtonStyle elevatedStyle(Color backgroundColor) {
    return ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    );
  }
}
