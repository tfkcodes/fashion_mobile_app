import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const _blue = Color(0xFFE94A01);
const _background = Color(0xFFF5F7FA);
const _slightGray = Color.fromARGB(255, 221, 225, 235);
const _darkBackground = Color(0xEA3A3939);
const _darkBackgroundBlueShade = Color(0xFF202122);
const _secondary = Color(0xFF016FE9);
const _slightBlueBackground = Color(0xFFFFFFFF);

class Themes {
  final lightTheme = ThemeData(
    primaryColor: _blue,
    canvasColor: _slightBlueBackground,
    scaffoldBackgroundColor: _background,
    primaryColorDark: _darkBackground,
    dividerColor: _slightGray,
    appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Color(0xFFE94A01),
        foregroundColor: Colors.black,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Color(0xFFE94A01))),
    shadowColor: Colors.black.withOpacity(0.1),
    colorScheme: const ColorScheme.light()
        .copyWith(
            primary: _blue, secondary: _secondary, onPrimary: Colors.white)
        .copyWith(surface: _background),
  );

  final darkTheme = ThemeData(
    canvasColor: _darkBackground,
    scaffoldBackgroundColor: _darkBackground,
    shadowColor: _darkBackgroundBlueShade.withOpacity(0.1),
    primaryColor: _blue,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.white, //here you can give the text color
    ),
    colorScheme: const ColorScheme.dark()
        .copyWith(
            surface: _darkBackgroundBlueShade,
            primary: _blue,
            secondary: _secondary,
            onPrimary: Colors.white)
        .copyWith(surface: _darkBackgroundBlueShade),
  );
}

final BoxShadow shadow = BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    spreadRadius: 0,
    blurRadius: 7,
    offset: const Offset(0, 0.5));
