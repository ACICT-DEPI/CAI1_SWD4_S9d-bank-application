import 'package:flutter/material.dart';

import 'color.dart';

ThemeData englishTheme = ThemeData(
  fontFamily: 'Poppins',
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
      color: AppColor.black,
    ),
    headlineMedium: TextStyle(
      fontSize: 26.0,
      fontWeight: FontWeight.bold,
      color: AppColor.black,
    ),
    bodyLarge: TextStyle(
      height: 1.5,
      color: AppColor.grey,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    bodyMedium: TextStyle(
      height: 2,
      color: AppColor.grey,
      fontSize: 14,
    ),
  ),
  primarySwatch: Colors.blue,
);

ThemeData arabicTheme = ThemeData(
  fontFamily: 'Cairo',
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
      color: AppColor.black,
    ),
    headlineMedium: TextStyle(
      fontSize: 26.0,
      fontWeight: FontWeight.bold,
      color: AppColor.black,
    ),
    bodyLarge: TextStyle(
      height: 1.5,
      color: AppColor.grey,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    bodyMedium: TextStyle(
      height: 2,
      color: AppColor.grey,
      fontSize: 14,
    ),
  ),
  primarySwatch: Colors.blue,
);
