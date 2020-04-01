
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Applocalizations {
  final Locale locale;
  Applocalizations(this.locale);

  static Applocalizations of(BuildContext context) {
    return Localizations.of<Applocalizations>(context, Applocalizations);
  }

  static const LocalizationsDelegate<Applocalizations> delegate = _AppLocalizationDelegate();

  Map<String, String> _localizedStrings;
  Future<bool> load() async {
    // Load the language JSON file from the "lang" folder
    String jsonString =
        await rootBundle.loadString('lib/domain/core/lang/${locale.languageCode}.json');
    
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    
    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return true;
  }

  String translate(String key) {
    return _localizedStrings[key];
  }
}

class _AppLocalizationDelegate extends LocalizationsDelegate<Applocalizations> {
  const _AppLocalizationDelegate();
  @override
  bool isSupported(Locale locale) {
    return ['es', 'en'].contains(locale.languageCode);
  }

  @override
  Future<Applocalizations> load(Locale locale) async {
    Applocalizations localizations = new Applocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(LocalizationsDelegate<Applocalizations> old) => false;
}