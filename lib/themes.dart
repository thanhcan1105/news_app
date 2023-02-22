import 'package:flutter/material.dart';

final ThemeData appThemeData = ThemeData(
  primaryColor: Colors.blueAccent,
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold)
  )
);

final ThemeData darkAppThemeData = ThemeData(
  primaryColor: Colors.blueGrey,
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold)
  )
);

class Themes {
  static final lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(),
  );
  static final darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(),
  );
}