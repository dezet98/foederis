// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
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

  /// `log in`
  String get login {
    return Intl.message(
      'log in',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get app_bar_title_register {
    return Intl.message(
      'Create account',
      name: 'app_bar_title_register',
      desc: '',
      args: [],
    );
  }

  /// `create account`
  String get text_button_go_to_register {
    return Intl.message(
      'create account',
      name: 'text_button_go_to_register',
      desc: '',
      args: [],
    );
  }

  /// `go to login`
  String get text_button_go_to_login {
    return Intl.message(
      'go to login',
      name: 'text_button_go_to_login',
      desc: '',
      args: [],
    );
  }

  /// `settings`
  String get settings {
    return Intl.message(
      'settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Filters`
  String get filter_screen_nav_title {
    return Intl.message(
      'Filters',
      name: 'filter_screen_nav_title',
      desc: '',
      args: [],
    );
  }

  /// `Apply filters`
  String get filter_screen_apply_button_text {
    return Intl.message(
      'Apply filters',
      name: 'filter_screen_apply_button_text',
      desc: '',
      args: [],
    );
  }

  /// `Frequency`
  String get filters_screen_filter_subtitile_frequency {
    return Intl.message(
      'Frequency',
      name: 'filters_screen_filter_subtitile_frequency',
      desc: '',
      args: [],
    );
  }

  /// `Sort by`
  String get filters_screen_filter_subtitile_sort_by {
    return Intl.message(
      'Sort by',
      name: 'filters_screen_filter_subtitile_sort_by',
      desc: '',
      args: [],
    );
  }

  /// `desc`
  String get filters_screen_filter_value_desc {
    return Intl.message(
      'desc',
      name: 'filters_screen_filter_value_desc',
      desc: '',
      args: [],
    );
  }

  /// `asc`
  String get filters_screen_filter_value_asc {
    return Intl.message(
      'asc',
      name: 'filters_screen_filter_value_asc',
      desc: '',
      args: [],
    );
  }

  /// `regular`
  String get filters_screen_filter_value_regular {
    return Intl.message(
      'regular',
      name: 'filters_screen_filter_value_regular',
      desc: '',
      args: [],
    );
  }

  /// `one-time`
  String get filters_screen_filter_value_one_time {
    return Intl.message(
      'one-time',
      name: 'filters_screen_filter_value_one_time',
      desc: '',
      args: [],
    );
  }

  /// `Bad credentials`
  String get bad_credentials {
    return Intl.message(
      'Bad credentials',
      name: 'bad_credentials',
      desc: '',
      args: [],
    );
  }
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