import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Base theme
final ThemeData theme = ThemeData(
  colorSchemeSeed: const Color.fromRGBO(81, 216, 35, 1),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    ),
  ),
  scaffoldBackgroundColor: Colors.grey.shade50,
  textTheme: GoogleFonts.baloo2TextTheme(),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
