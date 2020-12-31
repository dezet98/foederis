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

  static m0(howManyDays) => "${Intl.plural(howManyDays, one: '${howManyDays} dzień', other: '${howManyDays} dni')}";

  static m1(howManyHours) => "${Intl.plural(howManyHours, one: '${howManyHours} godzina', two: '${howManyHours} godziny', other: '${howManyHours} godzin')}";

  static m2(howManyMinutes) => "${Intl.plural(howManyMinutes, one: '${howManyMinutes} minuta', two: '${howManyMinutes} minuty', other: '${howManyMinutes} minut')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "activity_card_free_join" : MessageLookupByLibrary.simpleMessage("wolny udział"),
    "activity_card_registration" : MessageLookupByLibrary.simpleMessage("zapisy"),
    "app_bar_title_register" : MessageLookupByLibrary.simpleMessage("Create account"),
    "create_activity_screen_nav_title" : MessageLookupByLibrary.simpleMessage("Create activity"),
    "dialog_ok" : MessageLookupByLibrary.simpleMessage("OK"),
    "filter_screen_apply_button_text" : MessageLookupByLibrary.simpleMessage("Apply filters"),
    "filter_screen_nav_title" : MessageLookupByLibrary.simpleMessage("Filters"),
    "filters_screen_filter_subtitile_frequency" : MessageLookupByLibrary.simpleMessage("Frequency"),
    "filters_screen_filter_subtitile_sort_by" : MessageLookupByLibrary.simpleMessage("Sort by"),
    "filters_screen_filter_value_asc" : MessageLookupByLibrary.simpleMessage("asc"),
    "filters_screen_filter_value_desc" : MessageLookupByLibrary.simpleMessage("desc"),
    "filters_screen_filter_value_one_time" : MessageLookupByLibrary.simpleMessage("one-time"),
    "filters_screen_filter_value_regular" : MessageLookupByLibrary.simpleMessage("regular"),
    "guest_prohibited_access_info" : MessageLookupByLibrary.simpleMessage("Aby w pełni korzystać z aplikacji zaloguj się bądź załóż konto"),
    "guest_prohibited_access_info_tab_content" : MessageLookupByLibrary.simpleMessage("Aby móc tworzyć własne aktywności, przeglądać i uczestniczyć w innych dołącz do nas już teraz!"),
    "guest_prohibited_access_title" : MessageLookupByLibrary.simpleMessage("Odmowa dostępu"),
    "guest_prohibited_go_to_login" : MessageLookupByLibrary.simpleMessage("Zaloguj się"),
    "guest_prohibited_go_to_register" : MessageLookupByLibrary.simpleMessage("Zarejestruj"),
    "guest_prohibited_info_bottom_tab_label" : MessageLookupByLibrary.simpleMessage("Info"),
    "home_screen_account_tab_name" : MessageLookupByLibrary.simpleMessage("Account"),
    "home_screen_my_activity_tab_name" : MessageLookupByLibrary.simpleMessage("My activity"),
    "home_screen_search_activities_tab_name" : MessageLookupByLibrary.simpleMessage("Search"),
    "login_error_bad_credentials" : MessageLookupByLibrary.simpleMessage("Nie poprawny login bądź hasło"),
    "login_error_undefined" : MessageLookupByLibrary.simpleMessage("Wystąpił niezidentyfikowany problem przy logowaniu"),
    "login_screen_email_placeholder" : MessageLookupByLibrary.simpleMessage("Adres email"),
    "login_screen_go_to_register" : MessageLookupByLibrary.simpleMessage("Załóż konto"),
    "login_screen_login" : MessageLookupByLibrary.simpleMessage("Zaloguj się"),
    "login_screen_password_placeholder" : MessageLookupByLibrary.simpleMessage("Hasło"),
    "login_screen_visit_as_a_guest" : MessageLookupByLibrary.simpleMessage("Wejdź jako gość"),
    "plural_days" : m0,
    "plural_hours" : m1,
    "plural_minutes" : m2,
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
    "text_button_go_to_login" : MessageLookupByLibrary.simpleMessage("go to login")
  };
}
