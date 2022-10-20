import 'package:flutter/material.dart';

abstract class PokedexTheme {
  static ThemeData get light => ThemeData(
   scaffoldBackgroundColor: Colors.grey.shade100,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Poppins',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFFEC0344),
          secondary: Colors.black,
        ),
      );

  static ThemeData get dark => ThemeData();
}
