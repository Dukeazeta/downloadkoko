import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// KokoLabs Theme Configuration
/// Minimalistic and modern design system
class AppTheme {
  // Private constructor to prevent instantiation
  AppTheme._();

  // Brand Colors
  static const primaryColor = Color(0xFF6C63FF);
  static const secondaryColor = Color(0xFF2A2A2A);
  static const backgroundColor = Color(0xFFFAFAFA);
  static const errorColor = Color(0xFFE57373);

  // Dark Colors
  static const darkPrimaryColor = Color(0xFF8B85FF);
  static const darkBackgroundColor = Color(0xFF121212);
  static const darkSurfaceColor = Color(0xFF1E1E1E);

  // Button Styles
  static final _buttonShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
  );

  static final _elevatedButtonStyle = ElevatedButton.styleFrom(
    elevation: 0,
    padding: const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 16,
    ),
    shape: _buttonShape,
    minimumSize: const Size(double.infinity, 54),
  );

  static final _outlinedButtonStyle = OutlinedButton.styleFrom(
    padding: const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 16,
    ),
    shape: _buttonShape,
    minimumSize: const Size(double.infinity, 54),
  );

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      error: errorColor,
      background: backgroundColor,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: _elevatedButtonStyle.copyWith(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return primaryColor.withOpacity(0.5);
          }
          return primaryColor;
        }),
        foregroundColor: MaterialStateProperty.all(Colors.white),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: _outlinedButtonStyle.copyWith(
        side: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return BorderSide(color: primaryColor.withOpacity(0.5));
          }
          return BorderSide(color: primaryColor);
        }),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return primaryColor.withOpacity(0.5);
          }
          return primaryColor;
        }),
      ),
    ),
    cardTheme: CardTheme(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: darkPrimaryColor,
    scaffoldBackgroundColor: darkBackgroundColor,
    colorScheme: ColorScheme.dark(
      primary: darkPrimaryColor,
      secondary: secondaryColor,
      error: errorColor,
      background: darkBackgroundColor,
      surface: darkSurfaceColor,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: _elevatedButtonStyle.copyWith(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return darkPrimaryColor.withOpacity(0.5);
          }
          return darkPrimaryColor;
        }),
        foregroundColor: MaterialStateProperty.all(Colors.white),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: _outlinedButtonStyle.copyWith(
        side: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return BorderSide(color: darkPrimaryColor.withOpacity(0.5));
          }
          return BorderSide(color: darkPrimaryColor);
        }),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return darkPrimaryColor.withOpacity(0.5);
          }
          return darkPrimaryColor;
        }),
      ),
    ),
    cardTheme: CardTheme(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}
