import 'package:flutter/material.dart';
class AppColors{
  static  Color backgoundColorgray=HexColor("F5F5F7");
  static  Color backgoundColorRed=HexColor("FF1654");
  static  Color backgoundColorDrakgray=HexColor("E7E7EA");

  static  Color gray=HexColor("ABB4BD");
}
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}