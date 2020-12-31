import 'package:engineering_thesis/generated/intl/messages_all.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class S {
  S();

  static S current;

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();

      return S.current;
    });
  }

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  String plural_days(int howManyDays) => Intl.plural(
        howManyDays,
        one: '$howManyDays dzień',
        other: '$howManyDays dni',
        name: 'plural_days',
        args: [howManyDays],
      );

  String plural_hours(int howManyHours) => Intl.plural(
        howManyHours,
        one: '$howManyHours godzina',
        two: '$howManyHours godziny',
        other: '$howManyHours godzin',
        name: 'plural_hours',
        args: [howManyHours],
      );

  String plural_minutes(int howManyMinutes) => Intl.plural(
        howManyMinutes,
        one: '$howManyMinutes minuta',
        two: '$howManyMinutes minuty',
        other: '$howManyMinutes minut',
        name: 'plural_minutes',
        args: [howManyMinutes],
      );
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
      Locale.fromSubtags(languageCode: 'pl', countryCode: 'PL'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}
