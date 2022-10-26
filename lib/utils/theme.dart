import 'package:flutter/material.dart';

final Map<int, Color> color = {
  50: const Color.fromRGBO(234, 93, 96, .1),
  100: const Color.fromRGBO(234, 93, 96, .2),
  200: const Color.fromRGBO(234, 93, 96, .3),
  300: const Color.fromRGBO(234, 93, 96, .4),
  400: const Color.fromRGBO(234, 93, 96, .5),
  500: const Color.fromRGBO(234, 93, 96, .6),
  600: const Color.fromRGBO(234, 93, 96, .7),
  700: const Color.fromRGBO(234, 93, 96, .8),
  800: const Color.fromRGBO(234, 93, 96, .9),
  900: const Color.fromRGBO(234, 93, 96, 1),
  
};
final MaterialColor colorApp = MaterialColor(0xFFEA5D60, color);

abstract class PokedexTheme {
  static ThemeData get light => ThemeData(
        primarySwatch: colorApp,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'SFProDisplay',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      );

  static ThemeData get dark => ThemeData();
}
