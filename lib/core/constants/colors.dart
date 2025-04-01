import 'package:flutter/material.dart';

class AppColors {
  // Primary colors
  static const Color primary = Colors.green;
  static const Color primaryLight = Colors.lightGreen;
  static const Color primaryDark = Colors.greenAccent;

  static const Color red = Colors.red;

  // Background colors
  static Color background = Colors.grey[200]!;
  static const Color surface = Colors.white;

  // Text colors
  static const Color textPrimary = Colors.black87;
  static const Color textSecondary = Colors.black54;
  static const Color textHint = Colors.black38;

  // Border colors
  static const Color border = Colors.grey;

  // Status colors
  static const Color success = Colors.green;
  static const Color error = Colors.red;
  static const Color warning = Colors.orange;
  static const Color info = Colors.blue;

  // Overlay colors
  static Color discountOverlay = Colors.red.withValues(alpha: 0.5);
}
