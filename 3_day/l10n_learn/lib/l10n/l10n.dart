import 'package:flutter/material.dart';

abstract class L10n {
  static const List<Locale> supported = [
    Locale("en"),
    Locale("ru"),
  ];

  static String getFlag(Locale locale) {
    switch (locale.languageCode) {
      case "ru":
        return "🇷🇺";
      case "en":
      default:
        return "🇬🇧";
    }
  }
}
