import 'dart:math';
import 'package:flutter/material.dart';

List<Color> backgroundColors = [
  const Color(0x16FF00), // pale yellow
  const Color(0xBB2525), // pale yellow
  const Color(0x102C57), // pale yellow
  const Color(0xF11A7B), // pale yellow
  const Color(0x10A19D), // pale yellow
  const Color(0xFF0060), // pale yellow
  const Color(0x16FF00),
  const Color(0x3D0C11),
  const Color(0x004225),
];
getRandomColor() {
  Random random = Random();
  return backgroundColors[random.nextInt(backgroundColors.length)];
}

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(fontSize: 18, color: Colors.black87),
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.blue,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
);

ThemeData darkTheme = ThemeData(
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(fontSize: 18, color: Colors.white70),
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.red,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.red,
    brightness: Brightness.dark,
  ),
);