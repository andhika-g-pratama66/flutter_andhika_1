import 'package:flutter/material.dart';
import 'package:flutter_andhika_1/constants/default_font.dart';

InputDecoration formInputConstant({
  String? hintText,
  Widget? prefixIconData,
  Widget? prefixWidget,
  String? labelText,
  Widget? suffixIconData,
  Color? fillColor,
  bool? filled,
  String? suffixText,
  String? prefixText,
}) {
  return InputDecoration(
    filled: filled,
    hintText: hintText,
    labelText: labelText,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
    prefixIcon: prefixIconData,
    suffixIcon: suffixIconData,
    suffixText: suffixText,
    floatingLabelStyle: DefaultFont.bodyBold,
    prefixText: prefixText,
    errorMaxLines: 3,
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    fillColor: fillColor,

    prefixStyle: TextStyle(),
    prefix: prefixWidget,
  );
}
