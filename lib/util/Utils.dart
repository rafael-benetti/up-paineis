import 'dart:io';

import 'package:flutter/material.dart';

class Utils {
  static bool isDarkMode =
      false; //SchedulerBinding.instance!.window.platformBrightness == Brightness.dark;

  static Size size(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static String platformType() {
    return Platform.isAndroid ? "ANDROID" : "IOS";
  }

  static Color getColorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
    return Colors.white;
  }

  static bool isTablet() {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    return data.size.shortestSide < 600 ? false : true;
  }
}
