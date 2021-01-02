// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en_US locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en_US';

  static m0(minDate, maxDate) => "data musi być przed ${minDate} a po ${maxDate}";

  static m1(validatorName) => "Szczegóły dla pola ${validatorName}";

  static m2(min, max) => "długość danego wyrażenia powinna się zawierać w przedziale <${min}, ${max}>";

  static m3(min, max) => "wartość musi znajdować się w przedziale <${min}, ${max}>";

  static m4(znak) => "musi być spełniony warunek: wartość1 ${znak} wartość2";

  static m5(kilometres) => "${kilometres}km";

  static m6(howManyDays) => "${Intl.plural(howManyDays, one: '${howManyDays} dzień', other: '${howManyDays} dni')}";

  static m7(howManyHours) => "${Intl.plural(howManyHours, one: '${howManyHours} godzina', two: '${howManyHours} godziny', other: '${howManyHours} godzin')}";

  static m8(howManyMinutes) => "${Intl.plural(howManyMinutes, one: '${howManyMinutes} minuta', two: '${howManyMinutes} minuty', other: '${howManyMinutes} minut')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "activity_card_complete" : MessageLookupByLibrary.simpleMessage("complete"),
    "activity_card_free_join" : MessageLookupByLibrary.simpleMessage("wolny udział"),
    "activity_card_future" : MessageLookupByLibrary.simpleMessage("future"),
    "activity_card_registration" : MessageLookupByLibrary.simpleMessage("zapisy"),
    "app_bar_title_register" : MessageLookupByLibrary.simpleMessage("Create account"),
    "category_beer" : MessageLookupByLibrary.simpleMessage("beer"),
    "category_football" : MessageLookupByLibrary.simpleMessage("football"),
    "create_activity_screen_address_description" : MessageLookupByLibrary.simpleMessage("Adres aktywności, ważne by podać poprawny adres ponieważ użytkownicy wyszukują aktywności ze względu na lokalizację"),
    "create_activity_screen_address_label" : MessageLookupByLibrary.simpleMessage("Adres"),
    "create_activity_screen_apply_button_text" : MessageLookupByLibrary.simpleMessage("create"),
    "create_activity_screen_category_label" : MessageLookupByLibrary.simpleMessage("Kategoria"),
    "create_activity_screen_description_label" : MessageLookupByLibrary.simpleMessage("Opis"),
    "create_activity_screen_description_placeholder" : MessageLookupByLibrary.simpleMessage("..."),
    "create_activity_screen_free_join_description" : MessageLookupByLibrary.simpleMessage("Bez zatwierdzania uczestników sprawi że każdy kto zapiszę się na aktywność będzie już jej uczestnikiem. W przeciwnym razie może wysłąć prośbę o dołączenie którą ty musisz zaakceptować"),
    "create_activity_screen_free_join_label" : MessageLookupByLibrary.simpleMessage("Bez zatwierdzania uczestników"),
    "create_activity_screen_min_max_entry_description" : MessageLookupByLibrary.simpleMessage("Określenie liczby uczestników mogących się zapisać na aktywność, bez wymaganej liczby aktywność zostanie uznana za nie odbytą."),
    "create_activity_screen_min_max_entry_label" : MessageLookupByLibrary.simpleMessage("Liczba uczestników"),
    "create_activity_screen_nav_bar_title" : MessageLookupByLibrary.simpleMessage("Create activity"),
    "create_activity_screen_start_date_label" : MessageLookupByLibrary.simpleMessage("Data rozpoczęcia aktywności"),
    "create_activity_screen_title_label" : MessageLookupByLibrary.simpleMessage("Tytuł aktywności"),
    "create_activity_screen_title_placeholder" : MessageLookupByLibrary.simpleMessage("tytuł"),
    "date_time_picker_text" : MessageLookupByLibrary.simpleMessage("wybierz datę"),
    "dialog_ok" : MessageLookupByLibrary.simpleMessage("OK"),
    "filter_screen_apply_button_text" : MessageLookupByLibrary.simpleMessage("Apply filters"),
    "filter_screen_nav_title" : MessageLookupByLibrary.simpleMessage("Filters"),
    "filters_screen_filter_subtitile_frequency" : MessageLookupByLibrary.simpleMessage("Frequency"),
    "filters_screen_filter_subtitile_sort_by" : MessageLookupByLibrary.simpleMessage("Sort by"),
    "filters_screen_filter_value_asc" : MessageLookupByLibrary.simpleMessage("asc"),
    "filters_screen_filter_value_desc" : MessageLookupByLibrary.simpleMessage("desc"),
    "filters_screen_filter_value_one_time" : MessageLookupByLibrary.simpleMessage("one-time"),
    "filters_screen_filter_value_regular" : MessageLookupByLibrary.simpleMessage("regular"),
    "form_clear_button_text" : MessageLookupByLibrary.simpleMessage("clear"),
    "form_distance_apply_text" : MessageLookupByLibrary.simpleMessage("choose"),
    "form_distance_nav_bar_title" : MessageLookupByLibrary.simpleMessage("Choose search area"),
    "form_field_info_additional_info" : MessageLookupByLibrary.simpleMessage("opis"),
    "form_field_info_additional_validation" : MessageLookupByLibrary.simpleMessage("walidacja"),
    "form_field_info_date_time_range_validator" : m0,
    "form_field_info_dialog_title" : m1,
    "form_field_info_digits_validator" : MessageLookupByLibrary.simpleMessage("wartość musi być liczbą całkowitą"),
    "form_field_info_lenght_validator" : m2,
    "form_field_info_not_null_validator" : MessageLookupByLibrary.simpleMessage("musisz wypełnić to pole"),
    "form_field_info_numbers_range_validator" : m3,
    "form_field_info_numbers_validator" : m4,
    "form_field_info_phone_validator" : MessageLookupByLibrary.simpleMessage("numer telefonu musi być w postaci xxx xxx xxx"),
    "form_field_photo_choose_photo" : MessageLookupByLibrary.simpleMessage("wybierz zdjęcie"),
    "form_with_send_success_snackbar_info" : MessageLookupByLibrary.simpleMessage("Sukces wysyłania formularza!"),
    "gender_female" : MessageLookupByLibrary.simpleMessage("kobieta"),
    "gender_male" : MessageLookupByLibrary.simpleMessage("męszczyzna"),
    "gender_prefer_not_to_say" : MessageLookupByLibrary.simpleMessage("wolę nie mówić"),
    "guest_prohibited_access_info" : MessageLookupByLibrary.simpleMessage("Aby w pełni korzystać z aplikacji zaloguj się bądź załóż konto"),
    "guest_prohibited_access_info_tab_content" : MessageLookupByLibrary.simpleMessage("Aby móc tworzyć własne aktywności, przeglądać i uczestniczyć w innych dołącz do nas już teraz!"),
    "guest_prohibited_access_title" : MessageLookupByLibrary.simpleMessage("Odmowa dostępu"),
    "guest_prohibited_go_to_login" : MessageLookupByLibrary.simpleMessage("Zaloguj się"),
    "guest_prohibited_go_to_register" : MessageLookupByLibrary.simpleMessage("Zarejestruj"),
    "guest_prohibited_info_bottom_tab_label" : MessageLookupByLibrary.simpleMessage("Info"),
    "home_screen_account_tab_name" : MessageLookupByLibrary.simpleMessage("Account"),
    "home_screen_my_activity_tab_name" : MessageLookupByLibrary.simpleMessage("My activity"),
    "home_screen_search_activities_address_field_placeholder" : MessageLookupByLibrary.simpleMessage("Choose address"),
    "home_screen_search_activities_tab_name" : MessageLookupByLibrary.simpleMessage("Search"),
    "kilometres_short" : m5,
    "login_error_bad_credentials" : MessageLookupByLibrary.simpleMessage("Nie poprawny login bądź hasło"),
    "login_error_undefined" : MessageLookupByLibrary.simpleMessage("Wystąpił niezidentyfikowany problem przy logowaniu"),
    "login_screen_email_placeholder" : MessageLookupByLibrary.simpleMessage("Adres email"),
    "login_screen_go_to_register" : MessageLookupByLibrary.simpleMessage("Załóż konto"),
    "login_screen_login" : MessageLookupByLibrary.simpleMessage("Zaloguj się"),
    "login_screen_password_placeholder" : MessageLookupByLibrary.simpleMessage("Hasło"),
    "login_screen_visit_as_a_guest" : MessageLookupByLibrary.simpleMessage("Wejdź jako gość"),
    "plural_days" : m6,
    "plural_hours" : m7,
    "plural_minutes" : m8,
    "register_error_email_already_in_use" : MessageLookupByLibrary.simpleMessage("Podany email jest już zajęty"),
    "register_error_email_weak_password" : MessageLookupByLibrary.simpleMessage("Zbyt słabe hasło"),
    "register_error_invalid_email" : MessageLookupByLibrary.simpleMessage("Niepoprawny email"),
    "register_error_operation_not_allowed" : MessageLookupByLibrary.simpleMessage("Operacja niedozwolona"),
    "register_error_undefined" : MessageLookupByLibrary.simpleMessage("Wystąpił niezidentyfikowany problem przy rejestracji"),
    "register_screen_email_placeholder" : MessageLookupByLibrary.simpleMessage("Podaj swój email"),
    "register_screen_nav_bar_title" : MessageLookupByLibrary.simpleMessage("Zakładanie konta"),
    "register_screen_password_placeholder" : MessageLookupByLibrary.simpleMessage("Wymyśl hasło"),
    "register_screen_register" : MessageLookupByLibrary.simpleMessage("Utwórz"),
    "settings" : MessageLookupByLibrary.simpleMessage("settings"),
    "stepper_cancel_button_text" : MessageLookupByLibrary.simpleMessage("wróć"),
    "stepper_next_button_text" : MessageLookupByLibrary.simpleMessage("dalej"),
    "text_button_go_to_login" : MessageLookupByLibrary.simpleMessage("go to login"),
    "update_user_form_about_label" : MessageLookupByLibrary.simpleMessage("O sobie"),
    "update_user_form_birthday_label" : MessageLookupByLibrary.simpleMessage("Data urodzin"),
    "update_user_form_first_name_label" : MessageLookupByLibrary.simpleMessage("Imię"),
    "update_user_form_gender_label" : MessageLookupByLibrary.simpleMessage("Płeć"),
    "update_user_form_phone_label" : MessageLookupByLibrary.simpleMessage("Telefon"),
    "update_user_form_photo_label" : MessageLookupByLibrary.simpleMessage("Zdjęcie profilowe"),
    "update_user_form_second_name_label" : MessageLookupByLibrary.simpleMessage("Nazwisko")
  };
}
