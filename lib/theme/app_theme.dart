import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color bg = Color(0xFF050505);
  static const Color cardBg = Color(0xFF0D0D0D);
  static const Color neonGreen = Color(0xFF00FF9C);
  static const Color neonRed = Color(0xFFFF3B5C);
  static const Color neonCyan = Color(0xFF00E5FF);
  static const Color neonBlue = Color(0xFF2979FF);
  static const Color textSecondary = Color(0xFF8A8A8A);

  static ThemeData get darkCyberpunk {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: bg,
      primaryColor: neonGreen,
      fontFamily: GoogleFonts.jetBrainsMono().fontFamily,
      textTheme: GoogleFonts.jetBrainsMonoTextTheme().apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
