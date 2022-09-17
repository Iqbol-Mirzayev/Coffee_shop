import 'package:flutter/material.dart';

import '../constants/color_const.dart';

class ThemeComp {
  static ThemeData get myTheme => ThemeData(
        colorScheme: ColorScheme.light(primary: ColorConst.kPrimaryColor),
        scaffoldBackgroundColor: ColorConst.kPrimaryColor,
      );
}
