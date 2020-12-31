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

  /// `Zaloguj się`
  String get login_screen_login {
    return Intl.message(
      'Zaloguj się',
      name: 'login_screen_login',
      desc: '',
      args: [],
    );
  }

  /// `Załóż konto`
  String get login_screen_go_to_register {
    return Intl.message(
      'Załóż konto',
      name: 'login_screen_go_to_register',
      desc: '',
      args: [],
    );
  }

  /// `Wejdź jako gość`
  String get login_screen_visit_as_a_guest {
    return Intl.message(
      'Wejdź jako gość',
      name: 'login_screen_visit_as_a_guest',
      desc: '',
      args: [],
    );
  }

  /// `Adres email`
  String get login_screen_email_placeholder {
    return Intl.message(
      'Adres email',
      name: 'login_screen_email_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Hasło`
  String get login_screen_password_placeholder {
    return Intl.message(
      'Hasło',
      name: 'login_screen_password_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Utwórz`
  String get register_screen_register {
    return Intl.message(
      'Utwórz',
      name: 'register_screen_register',
      desc: '',
      args: [],
    );
  }

  /// `Zakładanie konta`
  String get register_screen_nav_bar_title {
    return Intl.message(
      'Zakładanie konta',
      name: 'register_screen_nav_bar_title',
      desc: '',
      args: [],
    );
  }

  /// `Podaj swój email`
  String get register_screen_email_placeholder {
    return Intl.message(
      'Podaj swój email',
      name: 'register_screen_email_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Wymyśl hasło`
  String get register_screen_password_placeholder {
    return Intl.message(
      'Wymyśl hasło',
      name: 'register_screen_password_placeholder',
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

  /// `Search`
  String get home_screen_search_activities_tab_name {
    return Intl.message(
      'Search',
      name: 'home_screen_search_activities_tab_name',
      desc: '',
      args: [],
    );
  }

  /// `My activity`
  String get home_screen_my_activity_tab_name {
    return Intl.message(
      'My activity',
      name: 'home_screen_my_activity_tab_name',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get home_screen_account_tab_name {
    return Intl.message(
      'Account',
      name: 'home_screen_account_tab_name',
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

  /// `Create activity`
  String get create_activity_screen_nav_title {
    return Intl.message(
      'Create activity',
      name: 'create_activity_screen_nav_title',
      desc: '',
      args: [],
    );
  }

  /// `Nie poprawny login bądź hasło`
  String get login_error_bad_credentials {
    return Intl.message(
      'Nie poprawny login bądź hasło',
      name: 'login_error_bad_credentials',
      desc: '',
      args: [],
    );
  }

  /// `Wystąpił niezidentyfikowany problem przy logowaniu`
  String get login_error_undefined {
    return Intl.message(
      'Wystąpił niezidentyfikowany problem przy logowaniu',
      name: 'login_error_undefined',
      desc: '',
      args: [],
    );
  }

  /// `Wystąpił niezidentyfikowany problem przy rejestracji`
  String get register_error_undefined {
    return Intl.message(
      'Wystąpił niezidentyfikowany problem przy rejestracji',
      name: 'register_error_undefined',
      desc: '',
      args: [],
    );
  }

  /// `Podany email jest już zajęty`
  String get register_error_email_already_in_use {
    return Intl.message(
      'Podany email jest już zajęty',
      name: 'register_error_email_already_in_use',
      desc: '',
      args: [],
    );
  }

  /// `Niepoprawny email`
  String get register_error_invalid_email {
    return Intl.message(
      'Niepoprawny email',
      name: 'register_error_invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `Zbyt słabe hasło`
  String get register_error_email_weak_password {
    return Intl.message(
      'Zbyt słabe hasło',
      name: 'register_error_email_weak_password',
      desc: '',
      args: [],
    );
  }

  /// `Operacja niedozwolona`
  String get register_error_operation_not_allowed {
    return Intl.message(
      'Operacja niedozwolona',
      name: 'register_error_operation_not_allowed',
      desc: '',
      args: [],
    );
  }

  /// `Aby w pełni korzystać z aplikacji zaloguj się bądź załóż konto`
  String get guest_prohibited_access_info {
    return Intl.message(
      'Aby w pełni korzystać z aplikacji zaloguj się bądź załóż konto',
      name: 'guest_prohibited_access_info',
      desc: '',
      args: [],
    );
  }

  /// `Aby móc tworzyć własne aktywności, przeglądać i uczestniczyć w innych dołącz do nas już teraz!`
  String get guest_prohibited_access_info_tab_content {
    return Intl.message(
      'Aby móc tworzyć własne aktywności, przeglądać i uczestniczyć w innych dołącz do nas już teraz!',
      name: 'guest_prohibited_access_info_tab_content',
      desc: '',
      args: [],
    );
  }

  /// `Odmowa dostępu`
  String get guest_prohibited_access_title {
    return Intl.message(
      'Odmowa dostępu',
      name: 'guest_prohibited_access_title',
      desc: '',
      args: [],
    );
  }

  /// `Zaloguj się`
  String get guest_prohibited_go_to_login {
    return Intl.message(
      'Zaloguj się',
      name: 'guest_prohibited_go_to_login',
      desc: '',
      args: [],
    );
  }

  /// `Zarejestruj`
  String get guest_prohibited_go_to_register {
    return Intl.message(
      'Zarejestruj',
      name: 'guest_prohibited_go_to_register',
      desc: '',
      args: [],
    );
  }

  /// `Info`
  String get guest_prohibited_info_bottom_tab_label {
    return Intl.message(
      'Info',
      name: 'guest_prohibited_info_bottom_tab_label',
      desc: '',
      args: [],
    );
  }

  /// `wolny udział`
  String get activity_card_free_join {
    return Intl.message(
      'wolny udział',
      name: 'activity_card_free_join',
      desc: '',
      args: [],
    );
  }

  /// `zapisy`
  String get activity_card_registration {
    return Intl.message(
      'zapisy',
      name: 'activity_card_registration',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get dialog_ok {
    return Intl.message(
      'OK',
      name: 'dialog_ok',
      desc: '',
      args: [],
    );
  }

  /// `{howManyMinutes,plural, =1{{howManyMinutes} minuta}=2{{howManyMinutes} minuty}other{{howManyMinutes} minut}}`
  String plural_minutes(num howManyMinutes) {
    return Intl.plural(
      howManyMinutes,
      one: '$howManyMinutes minuta',
      two: '$howManyMinutes minuty',
      other: '$howManyMinutes minut',
      name: 'plural_minutes',
      desc: '',
      args: [howManyMinutes],
    );
  }

  /// `{howManyHours,plural, =1{{howManyHours} godzina}=2{{howManyHours} godziny}other{{howManyHours} godzin}}`
  String plural_hours(num howManyHours) {
    return Intl.plural(
      howManyHours,
      one: '$howManyHours godzina',
      two: '$howManyHours godziny',
      other: '$howManyHours godzin',
      name: 'plural_hours',
      desc: '',
      args: [howManyHours],
    );
  }

  /// `{howManyDays,plural, =1{{howManyDays} dzień}other{{howManyDays} dni}}`
  String plural_days(num howManyDays) {
    return Intl.plural(
      howManyDays,
      one: '$howManyDays dzień',
      other: '$howManyDays dni',
      name: 'plural_days',
      desc: '',
      args: [howManyDays],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
      Locale.fromSubtags(languageCode: 'messages'),
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