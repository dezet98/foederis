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

  /// `Choose address`
  String get home_screen_search_activities_address_field_placeholder {
    return Intl.message(
      'Choose address',
      name: 'home_screen_search_activities_address_field_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Choose search area`
  String get form_distance_nav_bar_title {
    return Intl.message(
      'Choose search area',
      name: 'form_distance_nav_bar_title',
      desc: '',
      args: [],
    );
  }

  /// `choose`
  String get form_distance_apply_text {
    return Intl.message(
      'choose',
      name: 'form_distance_apply_text',
      desc: '',
      args: [],
    );
  }

  /// `clear`
  String get form_clear_button_text {
    return Intl.message(
      'clear',
      name: 'form_clear_button_text',
      desc: '',
      args: [],
    );
  }

  /// `Sukces wysyłania formularza!`
  String get form_with_send_success_snackbar_info {
    return Intl.message(
      'Sukces wysyłania formularza!',
      name: 'form_with_send_success_snackbar_info',
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

  /// `complete`
  String get activity_card_complete {
    return Intl.message(
      'complete',
      name: 'activity_card_complete',
      desc: '',
      args: [],
    );
  }

  /// `future`
  String get activity_card_future {
    return Intl.message(
      'future',
      name: 'activity_card_future',
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

  /// `{kilometres}km`
  String kilometres_short(Object kilometres) {
    return Intl.message(
      '${kilometres}km',
      name: 'kilometres_short',
      desc: '',
      args: [kilometres],
    );
  }

  /// `Create activity`
  String get create_activity_screen_nav_bar_title {
    return Intl.message(
      'Create activity',
      name: 'create_activity_screen_nav_bar_title',
      desc: '',
      args: [],
    );
  }

  /// `create`
  String get create_activity_screen_apply_button_text {
    return Intl.message(
      'create',
      name: 'create_activity_screen_apply_button_text',
      desc: '',
      args: [],
    );
  }

  /// `tytuł`
  String get create_activity_screen_title_placeholder {
    return Intl.message(
      'tytuł',
      name: 'create_activity_screen_title_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Tytuł aktywności`
  String get create_activity_screen_title_label {
    return Intl.message(
      'Tytuł aktywności',
      name: 'create_activity_screen_title_label',
      desc: '',
      args: [],
    );
  }

  /// `Bez zatwierdzania uczestników`
  String get create_activity_screen_free_join_label {
    return Intl.message(
      'Bez zatwierdzania uczestników',
      name: 'create_activity_screen_free_join_label',
      desc: '',
      args: [],
    );
  }

  /// `Bez zatwierdzania uczestników sprawi że każdy kto zapiszę się na aktywność będzie już jej uczestnikiem. W przeciwnym razie może wysłąć prośbę o dołączenie którą ty musisz zaakceptować`
  String get create_activity_screen_free_join_description {
    return Intl.message(
      'Bez zatwierdzania uczestników sprawi że każdy kto zapiszę się na aktywność będzie już jej uczestnikiem. W przeciwnym razie może wysłąć prośbę o dołączenie którą ty musisz zaakceptować',
      name: 'create_activity_screen_free_join_description',
      desc: '',
      args: [],
    );
  }

  /// `Data rozpoczęcia aktywności`
  String get create_activity_screen_start_date_label {
    return Intl.message(
      'Data rozpoczęcia aktywności',
      name: 'create_activity_screen_start_date_label',
      desc: '',
      args: [],
    );
  }

  /// `Liczba uczestników`
  String get create_activity_screen_min_max_entry_label {
    return Intl.message(
      'Liczba uczestników',
      name: 'create_activity_screen_min_max_entry_label',
      desc: '',
      args: [],
    );
  }

  /// `Określenie liczby uczestników mogących się zapisać na aktywność, bez wymaganej liczby aktywność zostanie uznana za nie odbytą.`
  String get create_activity_screen_min_max_entry_description {
    return Intl.message(
      'Określenie liczby uczestników mogących się zapisać na aktywność, bez wymaganej liczby aktywność zostanie uznana za nie odbytą.',
      name: 'create_activity_screen_min_max_entry_description',
      desc: '',
      args: [],
    );
  }

  /// `Kategoria`
  String get create_activity_screen_category_label {
    return Intl.message(
      'Kategoria',
      name: 'create_activity_screen_category_label',
      desc: '',
      args: [],
    );
  }

  /// `Adres`
  String get create_activity_screen_address_label {
    return Intl.message(
      'Adres',
      name: 'create_activity_screen_address_label',
      desc: '',
      args: [],
    );
  }

  /// `Adres aktywności, ważne by podać poprawny adres ponieważ użytkownicy wyszukują aktywności ze względu na lokalizację`
  String get create_activity_screen_address_description {
    return Intl.message(
      'Adres aktywności, ważne by podać poprawny adres ponieważ użytkownicy wyszukują aktywności ze względu na lokalizację',
      name: 'create_activity_screen_address_description',
      desc: '',
      args: [],
    );
  }

  /// `Opis`
  String get create_activity_screen_description_label {
    return Intl.message(
      'Opis',
      name: 'create_activity_screen_description_label',
      desc: '',
      args: [],
    );
  }

  /// `...`
  String get create_activity_screen_description_placeholder {
    return Intl.message(
      '...',
      name: 'create_activity_screen_description_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Zdjęcie profilowe`
  String get update_user_form_photo_label {
    return Intl.message(
      'Zdjęcie profilowe',
      name: 'update_user_form_photo_label',
      desc: '',
      args: [],
    );
  }

  /// `Imię`
  String get update_user_form_first_name_label {
    return Intl.message(
      'Imię',
      name: 'update_user_form_first_name_label',
      desc: '',
      args: [],
    );
  }

  /// `Nazwisko`
  String get update_user_form_second_name_label {
    return Intl.message(
      'Nazwisko',
      name: 'update_user_form_second_name_label',
      desc: '',
      args: [],
    );
  }

  /// `O sobie`
  String get update_user_form_about_label {
    return Intl.message(
      'O sobie',
      name: 'update_user_form_about_label',
      desc: '',
      args: [],
    );
  }

  /// `Telefon`
  String get update_user_form_phone_label {
    return Intl.message(
      'Telefon',
      name: 'update_user_form_phone_label',
      desc: '',
      args: [],
    );
  }

  /// `Data urodzin`
  String get update_user_form_birthday_label {
    return Intl.message(
      'Data urodzin',
      name: 'update_user_form_birthday_label',
      desc: '',
      args: [],
    );
  }

  /// `Płeć`
  String get update_user_form_gender_label {
    return Intl.message(
      'Płeć',
      name: 'update_user_form_gender_label',
      desc: '',
      args: [],
    );
  }

  /// `dalej`
  String get stepper_next_button_text {
    return Intl.message(
      'dalej',
      name: 'stepper_next_button_text',
      desc: '',
      args: [],
    );
  }

  /// `wróć`
  String get stepper_cancel_button_text {
    return Intl.message(
      'wróć',
      name: 'stepper_cancel_button_text',
      desc: '',
      args: [],
    );
  }

  /// `Szczegóły dla pola {validatorName}`
  String form_field_info_dialog_title(Object validatorName) {
    return Intl.message(
      'Szczegóły dla pola $validatorName',
      name: 'form_field_info_dialog_title',
      desc: '',
      args: [validatorName],
    );
  }

  /// `wartość musi być liczbą całkowitą`
  String get form_field_info_digits_validator {
    return Intl.message(
      'wartość musi być liczbą całkowitą',
      name: 'form_field_info_digits_validator',
      desc: '',
      args: [],
    );
  }

  /// `długość danego wyrażenia powinna się zawierać w przedziale <{min}, {max}>`
  String form_field_info_lenght_validator(Object min, Object max) {
    return Intl.message(
      'długość danego wyrażenia powinna się zawierać w przedziale <$min, $max>',
      name: 'form_field_info_lenght_validator',
      desc: '',
      args: [min, max],
    );
  }

  /// `wartość musi znajdować się w przedziale <{min}, {max}>`
  String form_field_info_numbers_range_validator(Object min, Object max) {
    return Intl.message(
      'wartość musi znajdować się w przedziale <$min, $max>',
      name: 'form_field_info_numbers_range_validator',
      desc: '',
      args: [min, max],
    );
  }

  /// `data musi być przed {minDate} a po {maxDate}`
  String form_field_info_date_time_range_validator(Object minDate, Object maxDate) {
    return Intl.message(
      'data musi być przed $minDate a po $maxDate',
      name: 'form_field_info_date_time_range_validator',
      desc: '',
      args: [minDate, maxDate],
    );
  }

  /// `musisz wypełnić to pole`
  String get form_field_info_not_null_validator {
    return Intl.message(
      'musisz wypełnić to pole',
      name: 'form_field_info_not_null_validator',
      desc: '',
      args: [],
    );
  }

  /// `numer telefonu musi być w postaci xxx xxx xxx`
  String get form_field_info_phone_validator {
    return Intl.message(
      'numer telefonu musi być w postaci xxx xxx xxx',
      name: 'form_field_info_phone_validator',
      desc: '',
      args: [],
    );
  }

  /// `musi być spełniony warunek: wartość1 {znak} wartość2`
  String form_field_info_numbers_validator(Object znak) {
    return Intl.message(
      'musi być spełniony warunek: wartość1 $znak wartość2',
      name: 'form_field_info_numbers_validator',
      desc: '',
      args: [znak],
    );
  }

  /// `opis`
  String get form_field_info_additional_info {
    return Intl.message(
      'opis',
      name: 'form_field_info_additional_info',
      desc: '',
      args: [],
    );
  }

  /// `walidacja`
  String get form_field_info_additional_validation {
    return Intl.message(
      'walidacja',
      name: 'form_field_info_additional_validation',
      desc: '',
      args: [],
    );
  }

  /// `wybierz datę`
  String get date_time_picker_text {
    return Intl.message(
      'wybierz datę',
      name: 'date_time_picker_text',
      desc: '',
      args: [],
    );
  }

  /// `football`
  String get category_football {
    return Intl.message(
      'football',
      name: 'category_football',
      desc: '',
      args: [],
    );
  }

  /// `beer`
  String get category_beer {
    return Intl.message(
      'beer',
      name: 'category_beer',
      desc: '',
      args: [],
    );
  }

  /// `męszczyzna`
  String get gender_male {
    return Intl.message(
      'męszczyzna',
      name: 'gender_male',
      desc: '',
      args: [],
    );
  }

  /// `kobieta`
  String get gender_female {
    return Intl.message(
      'kobieta',
      name: 'gender_female',
      desc: '',
      args: [],
    );
  }

  /// `wolę nie mówić`
  String get gender_prefer_not_to_say {
    return Intl.message(
      'wolę nie mówić',
      name: 'gender_prefer_not_to_say',
      desc: '',
      args: [],
    );
  }

  /// `wybierz zdjęcie`
  String get form_field_photo_choose_photo {
    return Intl.message(
      'wybierz zdjęcie',
      name: 'form_field_photo_choose_photo',
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