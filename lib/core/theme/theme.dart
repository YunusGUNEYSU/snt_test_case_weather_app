import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final class AppTheme {
  AppTheme._();
  static ThemeData get lightTheme => ThemeData(
      appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
      brightness: Brightness.light,
      useMaterial3: true,
      fontFamily: GoogleFonts.roboto().fontFamily,
      textTheme: GoogleFonts.robotoTextTheme(Typography.blackCupertino),
      colorScheme: ColorScheme.light(
          error: Colors.red,
          background: Colors.grey.shade400,
          primary: Colors.grey.shade300,
          inversePrimary: Colors.grey.shade600,
          secondary: Colors.grey.shade200));
  static ThemeData get darkTheme => ThemeData(
      appBarTheme: const AppBarTheme(elevation: 0, color: Colors.transparent),
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.roboto().fontFamily,
      textTheme: GoogleFonts.robotoTextTheme(Typography.whiteCupertino),
      colorScheme: ColorScheme.dark(
          error: Colors.red,
          background: Colors.grey.shade900,
          primary: Colors.grey.shade800,
          inversePrimary: Colors.grey.shade200,
          secondary: Colors.grey.shade700));
}
