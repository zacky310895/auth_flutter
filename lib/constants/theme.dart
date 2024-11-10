
import 'package:flutter/material.dart';

class AppTheme {
  static _border(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(width: 3, color: color)
  );
  static final ThemeData theme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: _border(
        Colors.white24,
      ),
      focusedBorder: _border(Colors.lightBlue.shade400.withOpacity(0.5))
    )
  );
}