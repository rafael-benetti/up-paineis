import 'package:flutter/material.dart';

import 'Utils.dart';
import 'constant.dart';

class ColorHelper {
  static Color getTextColor() {
    return Utils.isDarkMode ? kWhiteColor : kBlackFontColor;
  }
}
