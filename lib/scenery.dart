import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'scenery_painter.dart';
import 'themes/custom_themes.dart';
import 'themes/my_theme.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';

class Scenery extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SceneryState();
}

class _SceneryState extends State<Scenery> {
  // You can adjust this, as needed, but it should not change with the theme.
  final _textAreaHeight = 250.0;

  @override
  Widget build(BuildContext context) {
    final myTheme = Provider.of<MyTheme>(context, listen: false);
    return LayoutBuilder(
      builder: (context, constraints) => Stack(
        children: [
          CustomPaint(
            foregroundPainter: SceneryPainter(
              skyColor:
                  CustomWidgetThemes.of(context).sceneryThemeData!.skyFillColor,
              waterColor: CustomWidgetThemes.of(context)
                  .sceneryThemeData!
                  .waterFillColor,
              mountainColor: CustomWidgetThemes.of(context)
                  .sceneryThemeData!
                  .mountainFillColor,
              textHeight: _textAreaHeight,
              drawSun: CustomWidgetThemes.of(context).sceneryThemeData!.drawSun,
              drawMoon:
                  CustomWidgetThemes.of(context).sceneryThemeData!.drawMoon,
            ),
            child: Container(),
          ),
          myTheme.themeType == ThemeType.Other
              ? Center(
                  child: Container(
                    width: 100,
                    padding: EdgeInsets.only(bottom: 64),
                    child: Image.asset("assets/cartoon_pirate_ship.png"),
                  ),
                )
              : Container(),
          //todo(you) - Can you find a way to toggle this text area background color according to the theme?
          Positioned(
            bottom: 0,
            child: Container(
              height: _textAreaHeight,
              width: constraints.maxWidth,
              child: const SomeText(),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Theme(
              data: ThemeData(
                toggleableActiveColor: Theme.of(context).toggleableActiveColor,
                textTheme: TextTheme(
                  subtitle1: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              child: Container(
                width: constraints.maxWidth,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: ThemeSwitcher(
                          builder: (context) {
                            return RadioListTile<ThemeType>(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 4),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              title: const Text('Light'),
                              groupValue: myTheme.themeType,
                              value: ThemeType.Light,
                              onChanged: (ThemeType? mode) {
                                myTheme.setThemeType(
                                    ThemeType.Light, ThemeSwitcher.of(context));
                              },
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: ThemeSwitcher(
                          builder: (context) {
                            return RadioListTile<ThemeType>(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 4),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              title: const Text('Dark'),
                              groupValue: myTheme.themeType,
                              value: ThemeType.Dark,
                              onChanged: (ThemeType? mode) {
                                myTheme.setThemeType(
                                    ThemeType.Dark, ThemeSwitcher.of(context));
                              },
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: ThemeSwitcher(
                          builder: (context) {
                            return RadioListTile<ThemeType>(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 4),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              title: const Text('Pirate'),
                              groupValue: myTheme.themeType,
                              value: ThemeType.Other,
                              onChanged: (ThemeType? mode) =>
                                  myTheme.setThemeType(ThemeType.Other,
                                      ThemeSwitcher.of(context)),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SomeText extends StatelessWidget {
  const SomeText();
  @override
  Widget build(BuildContext context) {
    final myTheme = Provider.of<MyTheme>(context, listen: false);
    bool isPirate = myTheme.themeType == ThemeType.Other;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Flaiku',
          style: Theme.of(context).textTheme.headline3,
        ),
        Text(
          'Anonymous',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const SizedBox(height: 20),
        Text(
          isPirate ? 'Ahoy, Flutter Matey!' : 'Hello, Flutter Friend!',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Text(
          isPirate
              ? 'All hands aboard Flutter Challenge'
              : 'Welcome to Flutter Challenge',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Text(
          isPirate ? 'Help yerself to some grog :)' : 'We hope you have fun :)',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
