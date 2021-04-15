import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_theme.dart';
import 'scenery_theme.dart';

/// You can add themes for your own custom widgets here.
/// NB: for this challenge, it is only required to modify sceneryThemeData
class CustomWidgetThemes {
  static CustomWidgetThemes of(BuildContext context) =>
      CustomWidgetThemes._(context);

  SceneryThemeData? sceneryThemeData;

  // todo(you) These colors are dreary! Modify this so the picture has different values for light and dark modes.
  //  If you are feeling ambitions, get creative and make a third theme (or a fourth!)
  CustomWidgetThemes._(BuildContext context) {
    final themeType = Provider.of<MyTheme>(context).themeType;

    switch (themeType) {
      case ThemeType.Light:
        sceneryThemeData = SceneryThemeData(
          skyFillColor: Color.lerp(Colors.blue, Colors.white, 0.5)!,
          mountainFillColor: Colors.blueGrey,
          waterFillColor: Color.lerp(Colors.blue, Colors.white, 0.7)!,
          drawMoon: false,
          drawSun: true,
        );
        break;
      case ThemeType.Dark:
        sceneryThemeData = SceneryThemeData(
          skyFillColor: Colors.grey.shade900,
          mountainFillColor:
              Color.lerp(Colors.blueGrey, Colors.grey.shade900, 0.8)!,
          waterFillColor:
              Color.lerp(Colors.blueGrey, Colors.grey.shade900, 0.9)!,
          drawMoon: true,
          drawSun: false,
        );
        break;
      case ThemeType.Other:
        sceneryThemeData = SceneryThemeData(
          skyFillColor: Color.lerp(Colors.blue, Colors.white, 0.6)!,
          mountainFillColor: Colors.blueGrey,
          waterFillColor: Color.lerp(Colors.blue, Colors.white, 0.4)!,
          drawMoon: false,
          drawSun: true,
        );
        break;
    }
  }
}
