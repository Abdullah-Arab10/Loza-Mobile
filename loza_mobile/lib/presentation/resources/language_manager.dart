import 'package:flutter/material.dart';

enum LanguageType { ENGLISH, ARABIC }

const String arabic = "ar";
const String english = "en";
const String assetPathLocalisations = "assets/translations";

const Locale arabicLocale = Locale("ar", "SA");
const Locale englishLocale = Locale("en", "US");

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ENGLISH:
        return english;
      case LanguageType.ARABIC:
        return arabic;
    }
  }
}
