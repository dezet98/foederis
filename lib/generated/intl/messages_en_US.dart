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

  static m0(min, max) => "Od ${min} do ${max}";

  static m1(minDate, maxDate) => "data musi być przed ${minDate} a po ${maxDate}";

  static m2(validatorName) => "Szczegóły dla pola ${validatorName}";

  static m3(min, max) => "długość danego wyrażenia powinna się zawierać w przedziale <${min}, ${max}>";

  static m4(min, max) => "wartość musi znajdować się w przedziale <${min}, ${max}>";

  static m5(znak) => "musi być spełniony warunek: wartość1 ${znak} wartość2";

  static m6(kilometres) => "${kilometres}km";

  static m7(howManyDays) => "${Intl.plural(howManyDays, one: '${howManyDays} dzień', other: '${howManyDays} dni')}";

  static m8(howManyHours) => "${Intl.plural(howManyHours, one: '${howManyHours} godzina', two: '${howManyHours} godziny', other: '${howManyHours} godzin')}";

  static m9(howManyMinutes) => "${Intl.plural(howManyMinutes, one: '${howManyMinutes} minuta', two: '${howManyMinutes} minuty', other: '${howManyMinutes} minut')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "activity_card_complete" : MessageLookupByLibrary.simpleMessage("ukończone"),
    "activity_card_free_join" : MessageLookupByLibrary.simpleMessage("wolny udział"),
    "activity_card_future" : MessageLookupByLibrary.simpleMessage("przyszłe"),
    "activity_card_registration" : MessageLookupByLibrary.simpleMessage("zapisy"),
    "activity_details_screen_attendee_tab_give_organizator_rights_up" : MessageLookupByLibrary.simpleMessage("Odbierz prawa organizatora"),
    "activity_details_screen_attendee_tab_grant_organizator_grants" : MessageLookupByLibrary.simpleMessage("Nadaj prawa organizatora"),
    "activity_details_screen_attendee_tab_join_date" : MessageLookupByLibrary.simpleMessage("data dołączenia:"),
    "activity_details_screen_attendee_tab_nav_bar_title" : MessageLookupByLibrary.simpleMessage("Uczestnicy"),
    "activity_details_screen_attendee_tab_role" : MessageLookupByLibrary.simpleMessage("rola:"),
    "activity_details_screen_details_tab_address" : MessageLookupByLibrary.simpleMessage("Adres"),
    "activity_details_screen_details_tab_attendees_label" : MessageLookupByLibrary.simpleMessage("Ilość uczestników"),
    "activity_details_screen_details_tab_attendees_range" : m0,
    "activity_details_screen_details_tab_attendees_range_label" : MessageLookupByLibrary.simpleMessage("Możliwa ilość uczestników"),
    "activity_details_screen_details_tab_category" : MessageLookupByLibrary.simpleMessage("Kategoria"),
    "activity_details_screen_details_tab_description" : MessageLookupByLibrary.simpleMessage("Opis aktywności"),
    "activity_details_screen_details_tab_nav_bar_title" : MessageLookupByLibrary.simpleMessage("Szczegóły"),
    "activity_details_screen_details_tab_records_free_join" : MessageLookupByLibrary.simpleMessage("wolne"),
    "activity_details_screen_details_tab_records_label" : MessageLookupByLibrary.simpleMessage("Charakter zapisów"),
    "activity_details_screen_details_tab_records_with_appeal" : MessageLookupByLibrary.simpleMessage("wymagające akceptacji organizatora"),
    "activity_details_screen_details_tab_start_date" : MessageLookupByLibrary.simpleMessage("Data rozpoczęcia"),
    "activity_details_screen_free_join_tab_join_button" : MessageLookupByLibrary.simpleMessage("Dołącz do aktywności"),
    "activity_details_screen_free_join_tab_nav_bar_title" : MessageLookupByLibrary.simpleMessage("Zapisy"),
    "activity_details_screen_map_tab_nav_bar_title" : MessageLookupByLibrary.simpleMessage("Map"),
    "activity_details_screen_records_cancel_info" : MessageLookupByLibrary.simpleMessage("Twoja prośba oczekuje na decyzję organizatora"),
    "activity_details_screen_records_cancel_request" : MessageLookupByLibrary.simpleMessage("anuluj prośbę o dołączenie"),
    "activity_details_screen_records_nav_bar_tab" : MessageLookupByLibrary.simpleMessage("Zapisy"),
    "activity_details_screen_records_send_appeal" : MessageLookupByLibrary.simpleMessage("poproś o dołączenie do aktywności"),
    "activity_details_screen_request_tab_no_results" : MessageLookupByLibrary.simpleMessage("Brak próśb o dołączenie do aktywności"),
    "activity_details_screen_requests_tab_accept_request" : MessageLookupByLibrary.simpleMessage("akceptuj prośbę o dołączenie"),
    "activity_details_screen_requests_tab_join_title" : MessageLookupByLibrary.simpleMessage("Prośby o dołączenie"),
    "activity_role_attendee" : MessageLookupByLibrary.simpleMessage("uczestnik"),
    "activity_role_coorganizator" : MessageLookupByLibrary.simpleMessage("wspołorganizator"),
    "activity_role_maker" : MessageLookupByLibrary.simpleMessage("założyciel"),
    "app_bar_title_register" : MessageLookupByLibrary.simpleMessage("Tworzenie konta"),
    "appeal_join_form_comment_label" : MessageLookupByLibrary.simpleMessage("Wiadomość"),
    "appeal_join_form_comment_placeholder" : MessageLookupByLibrary.simpleMessage("Komentarz do prośby"),
    "category_beer" : MessageLookupByLibrary.simpleMessage("piwo"),
    "category_football" : MessageLookupByLibrary.simpleMessage("piłka nożna"),
    "create_activity_screen_address_description" : MessageLookupByLibrary.simpleMessage("Adres aktywności, ważne by podać poprawny adres ponieważ użytkownicy wyszukują aktywności ze względu na lokalizację"),
    "create_activity_screen_address_label" : MessageLookupByLibrary.simpleMessage("Adres"),
    "create_activity_screen_apply_button_text" : MessageLookupByLibrary.simpleMessage("utwórz"),
    "create_activity_screen_category_label" : MessageLookupByLibrary.simpleMessage("Kategoria"),
    "create_activity_screen_description_label" : MessageLookupByLibrary.simpleMessage("Opis"),
    "create_activity_screen_description_placeholder" : MessageLookupByLibrary.simpleMessage("..."),
    "create_activity_screen_free_join_description" : MessageLookupByLibrary.simpleMessage("Bez zatwierdzania uczestników sprawi że każdy kto zapiszę się na aktywność będzie już jej uczestnikiem. W przeciwnym razie może wysłąć prośbę o dołączenie którą ty musisz zaakceptować"),
    "create_activity_screen_free_join_label" : MessageLookupByLibrary.simpleMessage("Bez zatwierdzania uczestników"),
    "create_activity_screen_min_max_entry_description" : MessageLookupByLibrary.simpleMessage("Określenie liczby uczestników mogących się zapisać na aktywność, bez wymaganej liczby aktywność zostanie uznana za nie odbytą."),
    "create_activity_screen_min_max_entry_label" : MessageLookupByLibrary.simpleMessage("Liczba uczestników"),
    "create_activity_screen_nav_bar_title" : MessageLookupByLibrary.simpleMessage("Tworzenie aktywności"),
    "create_activity_screen_start_date_label" : MessageLookupByLibrary.simpleMessage("Data rozpoczęcia aktywności"),
    "create_activity_screen_title_label" : MessageLookupByLibrary.simpleMessage("Tytuł aktywności"),
    "create_activity_screen_title_placeholder" : MessageLookupByLibrary.simpleMessage("tytuł"),
    "date_time_picker_text" : MessageLookupByLibrary.simpleMessage("wybierz datę"),
    "dialog_ok" : MessageLookupByLibrary.simpleMessage("OK"),
    "filter_screen_apply_button_text" : MessageLookupByLibrary.simpleMessage("Zastosuj filtry"),
    "filter_screen_nav_title" : MessageLookupByLibrary.simpleMessage("Filtry"),
    "filters_screen_filter_subtitile_sort_by" : MessageLookupByLibrary.simpleMessage("Sortuj poprzez nazwę"),
    "filters_screen_filter_value_asc" : MessageLookupByLibrary.simpleMessage("rosnąco"),
    "filters_screen_filter_value_desc" : MessageLookupByLibrary.simpleMessage("malejąco"),
    "filters_screen_filter_value_free_join" : MessageLookupByLibrary.simpleMessage("wolne zapisy"),
    "filters_screen_filter_value_records_type" : MessageLookupByLibrary.simpleMessage("Typ zapisów"),
    "filters_screen_filter_value_with_appeal" : MessageLookupByLibrary.simpleMessage("do zatwierdzenia"),
    "form_clear_button_text" : MessageLookupByLibrary.simpleMessage("wyczyść"),
    "form_field_info_additional_info" : MessageLookupByLibrary.simpleMessage("opis"),
    "form_field_info_additional_validation" : MessageLookupByLibrary.simpleMessage("walidacja"),
    "form_field_info_date_time_range_validator" : m1,
    "form_field_info_dialog_title" : m2,
    "form_field_info_digits_validator" : MessageLookupByLibrary.simpleMessage("wartość musi być liczbą całkowitą"),
    "form_field_info_lenght_validator" : m3,
    "form_field_info_not_null_validator" : MessageLookupByLibrary.simpleMessage("musisz wypełnić to pole"),
    "form_field_info_numbers_range_validator" : m4,
    "form_field_info_numbers_validator" : m5,
    "form_field_info_phone_validator" : MessageLookupByLibrary.simpleMessage("numer telefonu musi być w postaci xxx xxx xxx"),
    "form_field_photo_choose_photo" : MessageLookupByLibrary.simpleMessage("wybierz zdjęcie"),
    "gender_female" : MessageLookupByLibrary.simpleMessage("kobieta"),
    "gender_male" : MessageLookupByLibrary.simpleMessage("męszczyzna"),
    "gender_prefer_not_to_say" : MessageLookupByLibrary.simpleMessage("wolę nie mówić"),
    "guest_prohibited_access_info" : MessageLookupByLibrary.simpleMessage("Aby w pełni korzystać z aplikacji zaloguj się bądź załóż konto"),
    "guest_prohibited_access_info_tab_content" : MessageLookupByLibrary.simpleMessage("Aby móc tworzyć własne aktywności, przeglądać i uczestniczyć w innych dołącz do nas już teraz!"),
    "guest_prohibited_access_title" : MessageLookupByLibrary.simpleMessage("Odmowa dostępu"),
    "guest_prohibited_go_to_login" : MessageLookupByLibrary.simpleMessage("Zaloguj się"),
    "guest_prohibited_go_to_register" : MessageLookupByLibrary.simpleMessage("Zarejestruj"),
    "guest_prohibited_info_bottom_tab_label" : MessageLookupByLibrary.simpleMessage("Info"),
    "home_screen_account_tab_name" : MessageLookupByLibrary.simpleMessage("Konto"),
    "home_screen_my_activity_tab_name" : MessageLookupByLibrary.simpleMessage("Moje aktywności"),
    "home_screen_search_activities_address_field_placeholder" : MessageLookupByLibrary.simpleMessage("Wybierz adres"),
    "home_screen_search_activities_tab_name" : MessageLookupByLibrary.simpleMessage("Szukaj"),
    "home_screen_settings_tab_edit_profile" : MessageLookupByLibrary.simpleMessage("edytuj profil"),
    "home_screen_settings_tab_log_out" : MessageLookupByLibrary.simpleMessage("wyloguj się"),
    "kilometres_short" : m6,
    "localization_en_US" : MessageLookupByLibrary.simpleMessage("angielski(USA)"),
    "localization_pl_PL" : MessageLookupByLibrary.simpleMessage("polski(Polska)"),
    "login_error_bad_credentials" : MessageLookupByLibrary.simpleMessage("Nie poprawny login bądź hasło"),
    "login_error_undefined" : MessageLookupByLibrary.simpleMessage("Wystąpił niezidentyfikowany problem przy logowaniu"),
    "login_screen_email_placeholder" : MessageLookupByLibrary.simpleMessage("Adres email"),
    "login_screen_go_to_register" : MessageLookupByLibrary.simpleMessage("Załóż konto"),
    "login_screen_login" : MessageLookupByLibrary.simpleMessage("Zaloguj się"),
    "login_screen_password_placeholder" : MessageLookupByLibrary.simpleMessage("Hasło"),
    "login_screen_visit_as_a_guest" : MessageLookupByLibrary.simpleMessage("Wejdź jako gość"),
    "plural_days" : m7,
    "plural_hours" : m8,
    "plural_minutes" : m9,
    "register_error_email_already_in_use" : MessageLookupByLibrary.simpleMessage("Podany email jest już zajęty"),
    "register_error_email_weak_password" : MessageLookupByLibrary.simpleMessage("Zbyt słabe hasło"),
    "register_error_invalid_email" : MessageLookupByLibrary.simpleMessage("Niepoprawny email"),
    "register_error_operation_not_allowed" : MessageLookupByLibrary.simpleMessage("Operacja niedozwolona"),
    "register_error_undefined" : MessageLookupByLibrary.simpleMessage("Wystąpił niezidentyfikowany problem przy rejestracji"),
    "register_screen_email_placeholder" : MessageLookupByLibrary.simpleMessage("Podaj swój email"),
    "register_screen_nav_bar_title" : MessageLookupByLibrary.simpleMessage("Zakładanie konta"),
    "register_screen_password_placeholder" : MessageLookupByLibrary.simpleMessage("Wymyśl hasło"),
    "register_screen_register" : MessageLookupByLibrary.simpleMessage("Utwórz"),
    "search_area_form_apply_text" : MessageLookupByLibrary.simpleMessage("szukaj"),
    "search_area_form_distance_description" : MessageLookupByLibrary.simpleMessage("Zakres poszukiwań określa promień od jakiego będą szukane aktywności od punktu wybranego wcześniej adresu"),
    "search_area_form_distance_label" : MessageLookupByLibrary.simpleMessage("Dystans"),
    "search_area_form_nav_bar_title" : MessageLookupByLibrary.simpleMessage("Zakres poszukiwań"),
    "settings" : MessageLookupByLibrary.simpleMessage("ustawienia"),
    "snackbar_create_activity_form_send_error" : MessageLookupByLibrary.simpleMessage("Błąd przy tworzeniu aktywności"),
    "snackbar_create_activity_form_send_success" : MessageLookupByLibrary.simpleMessage("Aktywność została utworzona pomyślnie"),
    "snackbar_form_send_error" : MessageLookupByLibrary.simpleMessage("Błąd przy wysyłaniu formularza"),
    "snackbar_form_send_error_success" : MessageLookupByLibrary.simpleMessage("Sukces wysyłania formularza"),
    "stepper_cancel_button_text" : MessageLookupByLibrary.simpleMessage("wróć"),
    "stepper_next_button_text" : MessageLookupByLibrary.simpleMessage("dalej"),
    "text_button_go_to_login" : MessageLookupByLibrary.simpleMessage("idź do logowania"),
    "update_user_form_about_label" : MessageLookupByLibrary.simpleMessage("O sobie"),
    "update_user_form_apply_button" : MessageLookupByLibrary.simpleMessage("zatwierdź"),
    "update_user_form_birthday_label" : MessageLookupByLibrary.simpleMessage("Data urodzin"),
    "update_user_form_first_name_label" : MessageLookupByLibrary.simpleMessage("Imię"),
    "update_user_form_gender_label" : MessageLookupByLibrary.simpleMessage("Płeć"),
    "update_user_form_nav_bar_title" : MessageLookupByLibrary.simpleMessage("Edycja profilu"),
    "update_user_form_phone_label" : MessageLookupByLibrary.simpleMessage("Telefon"),
    "update_user_form_photo_label" : MessageLookupByLibrary.simpleMessage("Zdjęcie profilowe"),
    "update_user_form_second_name_label" : MessageLookupByLibrary.simpleMessage("Nazwisko")
  };
}
