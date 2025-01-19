/// App-wide constants
class AppConstants {
  // Private constructor to prevent instantiation
  AppConstants._();

  // App Info
  static const String appName = 'downloadkoko';
  static const String appVersion = '1.0.0';
  
  // Storage Keys
  static const String themeKey = 'theme_mode';
  static const String downloadHistoryKey = 'download_history';
  
  // UI Constants
  static const double defaultPadding = 16.0;
  static const double defaultRadius = 12.0;
  static const double defaultSpacing = 8.0;
  
  // Animation Durations
  static const Duration defaultAnimationDuration = Duration(milliseconds: 300);
  static const Duration longAnimationDuration = Duration(milliseconds: 500);
  
  // Error Messages
  static const String networkError = 'Please check your internet connection';
  static const String invalidUrlError = 'Please enter a valid URL';
  static const String storageError = 'Storage permission is required';
}
