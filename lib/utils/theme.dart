import 'package:flutter/material.dart';

abstract class PokedexTheme {
  static ThemeData get light => ThemeData(
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
