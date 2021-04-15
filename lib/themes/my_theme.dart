import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme with ChangeNotifier {
  var _themeType = ThemeType.Light;

  ThemeType get themeType => _themeType;

  int _lastChange = 0;

  MyTheme() {
    /// If the user changes the theme in their device's settings, this is picked up on as well:
    final window = WidgetsBinding.instance?.window;
    window?.onPlatformBrightnessChanged = () {
      final brightness = window.platformBrightness;

      switch (brightness) {
        case Brightness.dark:
          setThemeType(ThemeType.Dark, null);
          break;
        case Brightness.light:
          setThemeType(ThemeType.Light, null);
      }
    };
  }
  void setThemeType(ThemeType themeType, ThemeSwitcherState? switcher) {
    if (DateTime.now().millisecondsSinceEpoch - _lastChange < 500) return;

    _lastChange = DateTime.now().millisecondsSinceEpoch;

    _themeType = themeType;

    if (switcher != null) {
      switcher.changeTheme(theme: currentThemeData);
    }
  }

  // todo(you) fill this in and make the different text styles visible in the text area look better in both light, dark and other mode?
  ThemeData get currentThemeData {
    switch (themeType) {
      case ThemeType.Light:
        return ThemeData.light().copyWith(
          primaryColor: Color.lerp(Colors.blue, Colors.white, 0.5)!,
          accentColor: Colors.yellow.shade700,
          toggleableActiveColor: Colors.yellow.shade800,
          appBarTheme: AppBarTheme(elevation: 0.0),
          scaffoldBackgroundColor: Color.lerp(Colors.blue, Colors.white, 0.7)!,
          textTheme: Typography.material2018().white.copyWith(
                headline3: GoogleFonts.crimsonText(
                  color: Colors.grey.shade900.withAlpha(180),
                  height: 0.5,
                ),
                subtitle1: GoogleFonts.crimsonPro(
                  color: Colors.grey.shade900.withAlpha(220),
                  fontSize: 22,
                  fontStyle: FontStyle.italic,
                ),
                bodyText1: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  height: 1.3,
                ),
              ),
          primaryTextTheme: TextTheme(
            headline6: GoogleFonts.crimsonText(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      case ThemeType.Dark:
        return ThemeData.dark().copyWith(
          toggleableActiveColor: Colors.grey.shade500,
          scaffoldBackgroundColor:
              Color.lerp(Colors.blueGrey, Colors.grey.shade900, 0.9)!,
          appBarTheme: AppBarTheme(elevation: 0.0),
          textTheme: Typography.material2018().white.copyWith(
                headline3: GoogleFonts.crimsonText(
                  color: Colors.grey.shade700,
                  height: 0.5,
                ),
                subtitle1: GoogleFonts.crimsonPro(
                  color: Colors.grey.shade600,
                  fontSize: 22,
                  fontStyle: FontStyle.italic,
                ),
                bodyText1: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 16,
                  height: 1.3,
                ),
              ),
          primaryTextTheme: TextTheme(
            headline6: GoogleFonts.crimsonText(
              color: Colors.grey.shade500,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      case ThemeType.Other:
        return ThemeData.light().copyWith(
          primaryColor: Color.lerp(Colors.blue, Colors.white, 0.6)!,
          accentColor: Colors.yellow.shade700,
          toggleableActiveColor: Colors.brown.shade400,
          appBarTheme: AppBarTheme(elevation: 0.0),
          scaffoldBackgroundColor: Color.lerp(Colors.blue, Colors.white, 0.4)!,
          textTheme: Typography.material2018().white.copyWith(
                headline3: GoogleFonts.petitFormalScript(
                  color: Colors.grey.shade900.withAlpha(180),
                  height: 0.5,
                ),
                subtitle1: GoogleFonts.meriendaOne(
                  color: Colors.grey.shade900.withAlpha(220),
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
                bodyText1: GoogleFonts.charm(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  height: 1.3,
                ),
              ),
          primaryTextTheme: TextTheme(
            headline6: GoogleFonts.petitFormalScript(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
    }
  }
}

enum ThemeType {
  Light,
  Dark,
  Other,
}
