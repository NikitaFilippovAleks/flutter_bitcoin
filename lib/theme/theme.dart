import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
  useMaterial3: true,

  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white),
    backgroundColor: const Color.fromARGB(255, 29, 29, 29),
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white
    )
  ),
  scaffoldBackgroundColor: const Color.fromARGB(255, 29, 29, 29),
  dividerTheme: DividerThemeData(
    color: Colors.white24,
    thickness: 1,
    space: 1
  ),
  // dividerColor: Colors.white24,
  listTileTheme: ListTileThemeData(
    iconColor: Colors.white
  ),
  textTheme: TextTheme(
    headlineLarge: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Colors.white
    ),
    headlineMedium: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white
    ),
    bodyMedium: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Colors.white
    ),
    bodySmall: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.white
    ),
    labelSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: Colors.white.withOpacity(0.7)
    ),
  )
);
