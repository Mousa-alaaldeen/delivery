import 'package:flutter/material.dart';

const MaterialColor primary = MaterialColor(_primaryPrimaryValue, <int, Color>{
  50: Color(0xFFFFFAED),
  100: Color(0xFFFFF4D1),
  200: Color(0xFFFFECB3),
  300: Color(0xFFFFE494),
  400: Color(0xFFFFDF7D),
  500: Color(_primaryPrimaryValue),
  600: Color(0xFFFFD55E),
  700: Color(0xFFFFCF53),
  800: Color(0xFFFFCA49),
  900: Color(0xFFFFC038),
});

const int _primaryPrimaryValue = 0xFFFFD966;

const MaterialColor primaryAccent =
    MaterialColor(_primaryAccentValue, <int, Color>{
  100: Color(0xFFFFFFFF),
  200: Color(_primaryAccentValue),
  400: Color(0xFFFFF5E1),
  700: Color(0xFFFFEDC8),
});
const int _primaryAccentValue = 0xFFFFFFFF;
