import 'package:flutter/material.dart';

class TextFormFieldDecoration {
  final String? labelText;

  TextFormFieldDecoration({this.labelText});
}

class TextFieldStyles {
  static InputDecoration decoration(
      TextFormFieldDecoration textFormFieldDecoration) {
    return InputDecoration(
      labelText: textFormFieldDecoration.labelText,
      border: const OutlineInputBorder(),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.0)),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2.0)),
      errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0)),
      focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0)),
    );
  }
}
