import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Path to your AppLocalizations file

class LocalizationService extends Translations {
  // Supported locales
  static final List<Locale> locales = [
    Locale('en', 'US'),
    Locale('fr', 'FR'),
    Locale('ar', 'AE'),
  ];

  // Fallback locale
  static final Locale fallbackLocale = Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': _getLocalizedStrings('en'),
        'fr_FR': _getLocalizedStrings('fr'),
        'ar_AE': _getLocalizedStrings('ar'),
      };

  // Load translations from AppLocalizations
  Map<String, String> _getLocalizedStrings(String languageCode) {
    final locale = Locale(languageCode);
    final localizations = lookupAppLocalizations(locale);
    return {
      'language': localizations.language,
      'appname': localizations.appname,
      'appslogan': localizations.appslogan,
      // Add more translations here
    };
  }

  // Change locale
  void changeLocale(String languageCode, String countryCode) {
    final locale = Locale(languageCode, countryCode);
    Get.updateLocale(locale);
  }
}
