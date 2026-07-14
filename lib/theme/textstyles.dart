import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._(); // prevents instantiation

  static const TextStyle h1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    fontFamily: 'CircularStd',
  );

  static const TextStyle h2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    fontFamily: 'CircularStd',
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    fontFamily: 'CircularStd',
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: 'CircularStd',
  );
}