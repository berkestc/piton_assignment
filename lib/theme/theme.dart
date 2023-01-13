import 'package:flutter/material.dart';

import '../constants/colors.dart';

final theme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  colorScheme: _colorScheme,
  appBarTheme: _appBarTheme,
  inputDecorationTheme: _inputDecorationTheme,
  fontFamily: _fontFamily,
  textTheme: _textTheme,
  elevatedButtonTheme: _elevatedButtonTheme,
  textButtonTheme: _textButtonTheme,
  chipTheme: _chipTheme,
  checkboxTheme: _checkboxTheme,
  toggleableActiveColor: primaryColor,
  progressIndicatorTheme: _progressIndicatorTheme,
);

const _colorScheme = ColorScheme.light(secondary: primaryColor);

const _fontFamily = "Manrope";
const _fontHeight = 1.36;

const _appBarTheme = AppBarTheme(
  shadowColor: Color(0xFFF4F4FF),
  toolbarHeight: 87,
  titleTextStyle: TextStyle(
    fontSize: 20,
    height: _fontHeight,
    fontWeight: FontWeight.bold,
    color: textColor,
    fontFamily: _fontFamily,
  ),
  backgroundColor: Colors.white,
  elevation: 1,
);

final _elevatedButtonTheme = ElevatedButtonThemeData(
  style: ButtonStyle(
    foregroundColor: MaterialStateProperty.all(Colors.white),
    minimumSize: MaterialStateProperty.all(const Size.fromHeight(60)),
    backgroundColor: MaterialStateProperty.all(elevatedButtonColor),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
    elevation: MaterialStateProperty.all(0),
    textStyle: MaterialStateProperty.all(
      const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16,
        height: _fontHeight,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
);

final _textButtonTheme = TextButtonThemeData(
  style: ButtonStyle(
    overlayColor: MaterialStateProperty.all(Colors.transparent),
    minimumSize: MaterialStateProperty.all(const Size.fromHeight(60)),
    foregroundColor: MaterialStateProperty.all(primaryColor),
    backgroundColor: MaterialStateProperty.all(Colors.transparent),
    textStyle: MaterialStateProperty.all(
      const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16,
        height: _fontHeight,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
);

final _inputDecorationTheme = InputDecorationTheme(
  hintStyle: TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    height: _fontHeight,
    fontWeight: FontWeight.normal,
    color: textColor.withOpacity(0.4),
  ),
  labelStyle: const TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    height: _fontHeight,
    fontWeight: FontWeight.w600,
    color: textColor,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide.none,
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide.none,
  ),
  filled: true,
  fillColor: inputDecorationFilledColor,
  prefixIconColor: textColor.withOpacity(0.4),
  suffixIconColor: textColor.withOpacity(0.4),
);

final _textTheme = TextTheme(
  headline5: const TextStyle(
    fontSize: 20,
    height: _fontHeight,
    fontWeight: FontWeight.bold,
    color: textColor,
    fontFamily: _fontFamily,
  ),
  headline6: TextStyle(
    fontSize: 16,
    height: _fontHeight,
    fontWeight: FontWeight.w600,
    color: textColor.withOpacity(0.6),
    fontFamily: _fontFamily,
  ),
  bodyText1: const TextStyle(
    fontSize: 12,
    height: _fontHeight,
    fontWeight: FontWeight.w600,
    color: textColor,
    fontFamily: _fontFamily,
  ),
  bodyText2: const TextStyle(
    fontSize: 10,
    height: _fontHeight,
    fontWeight: FontWeight.w600,
    color: textColor,
    fontFamily: _fontFamily,
  ),
  subtitle1: TextStyle(
    fontSize: 12,
    height: _fontHeight,
    fontWeight: FontWeight.w600,
    color: textColor.withOpacity(0.6),
    fontFamily: _fontFamily,
  ),
  subtitle2: TextStyle(
    fontSize: 10,
    height: _fontHeight,
    fontWeight: FontWeight.w600,
    color: textColor.withOpacity(0.6),
    fontFamily: _fontFamily,
  ),
);

final _chipTheme = ChipThemeData(
  showCheckmark: false,
  backgroundColor: inputDecorationFilledColor,
  elevation: 0,
  pressElevation: 0,
  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  selectedColor: primaryColor,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  labelStyle: const TextStyle(
    fontSize: 16,
    height: _fontHeight,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    fontFamily: _fontFamily,
  ),
);

final _checkboxTheme = CheckboxThemeData(
  side: const BorderSide(color: primaryColor),
  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
);

const _progressIndicatorTheme =
    ProgressIndicatorThemeData(color: elevatedButtonColor, circularTrackColor: Colors.white);
