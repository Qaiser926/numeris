import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex("#e67700");
  static Color LightRed = HexColor.fromHex("#ff0000");
  static Color lightBlue = HexColor.fromHex("#0000ff");
  static Color lightGreen = HexColor.fromHex("#00ff00");
  static Color offWhite = HexColor.fromHex("#fdefcb");
  static Color orange = HexColor.fromHex("#ff6600");
  static Color yellow = HexColor.fromHex("##fff002");
  static Color darkOrange = HexColor.fromHex("#FF4500");
  static Color lightYellow = HexColor.fromHex("#f6e9b2");
  static Color Yellow = HexColor.fromHex("#f0ee6a");
  static Color Background = HexColor.fromHex("#5B7333");
  static Color Green = HexColor.fromHex("#00ff01");
  static Color button = HexColor.fromHex("#063b2b");
  static Color button1 = HexColor.fromHex("#e0ad6b");
  static Color button2 = HexColor.fromHex("#f98f37");
  static Color green = HexColor.fromHex("#64df48");
  static Color Orange = HexColor.fromHex("#f03d2f");
  static Color blue = HexColor.fromHex("#1eaae0");
  static Color maroon = HexColor.fromHex("##670d00");
  static Color text3 = HexColor.fromHex("#332014");
  static Color o = HexColor.fromHex("#e67700");
  static Color b = HexColor.fromHex("#364fc7");
  static Color r = HexColor.fromHex("#c92a2a");
  static Color p = HexColor.fromHex("#862e9c");



  // new colors
  static Color text = HexColor.fromHex("#e09e56");
  static Color grey1 = HexColor.fromHex("#707070");
  static Color grey2 = HexColor.fromHex("#797979");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color error = HexColor.fromHex("#e61f34");
  static Color black= HexColor.fromHex("#000000"); // red color
}






extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF" + hexColorString; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
