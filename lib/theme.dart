import 'package:flutter/material.dart';

const primaryColor = Color(0xFFFF5F77);
const secondaryColor = Color(0xFFFFDB29);
const primaryText = Color(0xFF0F0F0F);

final primarySwatch = createMaterialColor(primaryColor);

final ThemeData mainTheme = ThemeData(
  fontFamily: 'WorkSans',
  primarySwatch: primarySwatch,
  iconTheme: IconThemeData(color: Colors.black),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 0,
  ),
  bottomAppBarTheme: BottomAppBarTheme(
    color: primaryText,
    shape: CircularNotchedRectangle(),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: secondaryColor,
      onPrimary: Colors.black,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ElevatedButton.styleFrom(
      onPrimary: Colors.black,
    ),
  ),
);

final TextStyle appBarTextStyle = TextStyle(
  color: Colors.black,
  fontFamily: 'Inter',
  fontWeight: FontWeight.w600,
  fontSize: 22,
);

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}
