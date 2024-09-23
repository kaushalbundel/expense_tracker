import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';

void main() {
  final kColortheme =
      ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 36, 253, 90));

  final kdarkColorScheme =
      ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 12, 58, 0));
  runApp(
    MaterialApp(
      darkTheme: ThemeData().copyWith(colorScheme: kdarkColorScheme),
      themeMode: ThemeMode
          .dark, //somehow dark theme is not working. I mean the scafold color is not changing as per needed.
      theme: ThemeData().copyWith(
        colorScheme: kColortheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColortheme.onPrimaryContainer,
          // foregroundColor: Colors.white,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColortheme.surfaceContainerLow,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: const TextStyle(fontWeight: FontWeight.w800),
            ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kColortheme.secondaryContainer),
        ),
      ),
      home: const Expenses(),
    ),
  );
}
