import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText {
  AppText._();

  /// Base text style factory
  static TextStyle _baseStyle({
    double fontSize = 20,
  }) {
    return GoogleFonts.lato(
      fontSize: fontSize,
      color: Colors.white,
    );
  }

  /// Extra large style (e.g., for headers or large titles)
  static final TextStyle xxl = _baseStyle(fontSize: 50);
  /// Extra large style (e.g., for headers or large titles)
  static final TextStyle xl = _baseStyle(fontSize: 24);

  /// Large style (e.g., for section titles)
  static final TextStyle large = _baseStyle(fontSize: 20);

  /// Medium style (e.g., for normal content text)
  static final TextStyle medium = _baseStyle(fontSize: 16);

  /// Small style (e.g., for captions or secondary text)
  static final TextStyle small = _baseStyle(fontSize: 14);
}
