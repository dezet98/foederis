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

  static m0(min, max) => "From ${min} to ${max}";

  static m1(minDate, maxDate) => "date must be before ${minDate} and after ${maxDate}";

  static m2(validatorName) => "Details for the field ${validatorName}";

  static m3(min, max) => "długość danego wyrażenia powinna się zawierać w przedziale <${min}, ${max}>";

  static m4(min, max) => "the length of a given expression should be within the range <${min}, ${max}>";

  static m5(character) => "the condition must be met: value1 ${character} value2";

  static m6(kilometres) => "${kilometres}km";

  static m7(howManyDays) => "${Intl.plural(howManyDays, one: '${howManyDays} day', other: '${howManyDays} days')}";

  static m8(howManyHours) => "${Intl.plural(howManyHours, one: '${howManyHours} hour', two: '${howManyHours} hours', other: '${howManyHours} hours')}";

  static m9(howManyMinutes) => "${Intl.plural(howManyMinutes, one: '${howManyMinutes} minute', two: '${howManyMinutes} minutes', other: '${howManyMinutes} minutes')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "activity_cancel_status" : MessageLookupByLibrary.simpleMessage("canceled"),
    "activity_card_complete" : MessageLookupByLibrary.simpleMessage("finish"),
    "activity_card_free_join" : MessageLookupByLibrary.simpleMessage("free join"),
    "activity_card_future" : MessageLookupByLibrary.simpleMessage("future"),
    "activity_card_registration" : MessageLookupByLibrary.simpleMessage("records"),
    "activity_details_screen_attendee_tab_give_organizator_rights_up" : MessageLookupByLibrary.simpleMessage("Take away the rights of the co-organizer"),
    "activity_details_screen_attendee_tab_grant_organizator_grants" : MessageLookupByLibrary.simpleMessage("Give co-organizer rights"),
    "activity_details_screen_attendee_tab_join_date" : MessageLookupByLibrary.simpleMessage("date of joining:"),
    "activity_details_screen_attendee_tab_nav_bar_title" : MessageLookupByLibrary.simpleMessage("Attendees"),
    "activity_details_screen_attendee_tab_role" : MessageLookupByLibrary.simpleMessage("role:"),
    "activity_details_screen_cancel_activity_button_text" : MessageLookupByLibrary.simpleMessage("cancel activity"),
    "activity_details_screen_cancel_involvement_button_text" : MessageLookupByLibrary.simpleMessage("cancel participation in the activity"),
    "activity_details_screen_details_tab_address" : MessageLookupByLibrary.simpleMessage("Address"),
    "activity_details_screen_details_tab_attendees_label" : MessageLookupByLibrary.simpleMessage("Number of attendees"),
    "activity_details_screen_details_tab_attendees_range" : m0,
    "activity_details_screen_details_tab_attendees_range_label" : MessageLookupByLibrary.simpleMessage("Possible number of attendees"),
    "activity_details_screen_details_tab_category" : MessageLookupByLibrary.simpleMessage("Category"),
    "activity_details_screen_details_tab_description" : MessageLookupByLibrary.simpleMessage("About activity"),
    "activity_details_screen_details_tab_nav_bar_title" : MessageLookupByLibrary.simpleMessage("Details"),
    "activity_details_screen_details_tab_records_free_join" : MessageLookupByLibrary.simpleMessage("free"),
    "activity_details_screen_details_tab_records_label" : MessageLookupByLibrary.simpleMessage("The nature of the records"),
    "activity_details_screen_details_tab_records_with_appeal" : MessageLookupByLibrary.simpleMessage("requiring approval"),
    "activity_details_screen_details_tab_start_date" : MessageLookupByLibrary.simpleMessage("Start date"),
    "activity_details_screen_details_tab_status" : MessageLookupByLibrary.simpleMessage("Status"),
    "activity_details_screen_free_join_tab_join_button" : MessageLookupByLibrary.simpleMessage("Join to activity"),
    "activity_details_screen_free_join_tab_nav_bar_title" : MessageLookupByLibrary.simpleMessage("Records"),
    "activity_details_screen_map_tab_nav_bar_title" : MessageLookupByLibrary.simpleMessage("Map"),
    "activity_details_screen_records_cancel_info" : MessageLookupByLibrary.simpleMessage("Your request is awaiting the decision of the organizer"),
    "activity_details_screen_records_cancel_request" : MessageLookupByLibrary.simpleMessage("cancel the request to join"),
    "activity_details_screen_records_nav_bar_tab" : MessageLookupByLibrary.simpleMessage("Records"),
    "activity_details_screen_records_send_appeal" : MessageLookupByLibrary.simpleMessage("ask to join the activity"),
    "activity_details_screen_request_tab_no_results" : MessageLookupByLibrary.simpleMessage("No requests to join the activity"),
    "activity_details_screen_requests_tab_accept_request" : MessageLookupByLibrary.simpleMessage("accept the request to join"),
    "activity_details_screen_requests_tab_join_title" : MessageLookupByLibrary.simpleMessage("Requests to join"),
    "activity_finish_status" : MessageLookupByLibrary.simpleMessage("finished"),
    "activity_no_places_status" : MessageLookupByLibrary.simpleMessage("no places"),
    "activity_open_status" : MessageLookupByLibrary.simpleMessage("during registration"),
    "activity_role_attendee" : MessageLookupByLibrary.simpleMessage("attendee"),
    "activity_role_coorganizator" : MessageLookupByLibrary.simpleMessage("co-organizer"),
    "activity_role_maker" : MessageLookupByLibrary.simpleMessage("maker"),
    "app_bar_title_register" : MessageLookupByLibrary.simpleMessage("Create account"),
    "appeal_join_form_comment_label" : MessageLookupByLibrary.simpleMessage("Message"),
    "appeal_join_form_comment_placeholder" : MessageLookupByLibrary.simpleMessage("Comment to request"),
    "category_beer" : MessageLookupByLibrary.simpleMessage("beer"),
    "category_football" : MessageLookupByLibrary.simpleMessage("football"),
    "create_activity_screen_address_choose" : MessageLookupByLibrary.simpleMessage("choose location"),
    "create_activity_screen_address_description" : MessageLookupByLibrary.simpleMessage("Activity address, it is important to enter the correct address because users search for activity based on location"),
    "create_activity_screen_address_label" : MessageLookupByLibrary.simpleMessage("Address"),
    "create_activity_screen_apply_button_text" : MessageLookupByLibrary.simpleMessage("create"),
    "create_activity_screen_category_label" : MessageLookupByLibrary.simpleMessage("Category"),
    "create_activity_screen_description_label" : MessageLookupByLibrary.simpleMessage("Description"),
    "create_activity_screen_description_placeholder" : MessageLookupByLibrary.simpleMessage("..."),
    "create_activity_screen_free_join_description" : MessageLookupByLibrary.simpleMessage("Without approval of participants, it will make everyone who signs up for the activity a participant. Otherwise, it can send a request to join which you must accept"),
    "create_activity_screen_free_join_label" : MessageLookupByLibrary.simpleMessage("No attendees approval"),
    "create_activity_screen_min_max_entry_description" : MessageLookupByLibrary.simpleMessage("Determining the number of participants who can enroll in an activity without the required number of participants will be considered not completed."),
    "create_activity_screen_min_max_entry_label" : MessageLookupByLibrary.simpleMessage("A number of participants"),
    "create_activity_screen_nav_bar_title" : MessageLookupByLibrary.simpleMessage("Create activity"),
    "create_activity_screen_start_date_label" : MessageLookupByLibrary.simpleMessage("Start date"),
    "create_activity_screen_title_label" : MessageLookupByLibrary.simpleMessage("Activity title"),
    "create_activity_screen_title_placeholder" : MessageLookupByLibrary.simpleMessage("title"),
    "date_time_picker_text" : MessageLookupByLibrary.simpleMessage("choose date"),
    "dialog_ok" : MessageLookupByLibrary.simpleMessage("OK"),
    "filter_screen_apply_button_text" : MessageLookupByLibrary.simpleMessage("Apply filters"),
    "filter_screen_nav_title" : MessageLookupByLibrary.simpleMessage("Filters"),
    "filters_screen_filter_subtitile_sort_by" : MessageLookupByLibrary.simpleMessage("Sort by name"),
    "filters_screen_filter_value_asc" : MessageLookupByLibrary.simpleMessage("asc"),
    "filters_screen_filter_value_desc" : MessageLookupByLibrary.simpleMessage("desc"),
    "filters_screen_filter_value_free_join" : MessageLookupByLibrary.simpleMessage("free join records"),
    "filters_screen_filter_value_records_type" : MessageLookupByLibrary.simpleMessage("Type of records"),
    "filters_screen_filter_value_with_appeal" : MessageLookupByLibrary.simpleMessage("for approval"),
    "form_clear_button_text" : MessageLookupByLibrary.simpleMessage("clear"),
    "form_field_info_additional_info" : MessageLookupByLibrary.simpleMessage("description"),
    "form_field_info_additional_validation" : MessageLookupByLibrary.simpleMessage("validation"),
    "form_field_info_date_time_range_validator" : m1,
    "form_field_info_dialog_title" : m2,
    "form_field_info_digits_validator" : MessageLookupByLibrary.simpleMessage("value must be an integer"),
    "form_field_info_lenght_validator" : m3,
    "form_field_info_not_null_validator" : MessageLookupByLibrary.simpleMessage("mandatory field"),
    "form_field_info_numbers_range_validator" : m4,
    "form_field_info_numbers_validator" : m5,
    "form_field_info_phone_validator" : MessageLookupByLibrary.simpleMessage("phone number must be in the form xxx xxx xxx"),
    "form_field_photo_choose_photo" : MessageLookupByLibrary.simpleMessage("choose photo"),
    "gender_female" : MessageLookupByLibrary.simpleMessage("female"),
    "gender_male" : MessageLookupByLibrary.simpleMessage("man"),
    "gender_prefer_not_to_say" : MessageLookupByLibrary.simpleMessage("prefere not to say"),
    "guest_prohibited_access_info" : MessageLookupByLibrary.simpleMessage("To fully use the application, log in or create an account"),
    "guest_prohibited_access_info_tab_content" : MessageLookupByLibrary.simpleMessage("To be able to create your own activities, view and participate in others, join us now!"),
    "guest_prohibited_access_title" : MessageLookupByLibrary.simpleMessage("Access denied"),
    "guest_prohibited_go_to_login" : MessageLookupByLibrary.simpleMessage("Log in"),
    "guest_prohibited_go_to_register" : MessageLookupByLibrary.simpleMessage("Register"),
    "guest_prohibited_info_bottom_tab_label" : MessageLookupByLibrary.simpleMessage("Info"),
    "home_screen_account_tab_name" : MessageLookupByLibrary.simpleMessage("Account"),
    "home_screen_my_activity_tab_name" : MessageLookupByLibrary.simpleMessage("My activities"),
    "home_screen_search_activities_address_field_placeholder" : MessageLookupByLibrary.simpleMessage("Choose address"),
    "home_screen_search_activities_error" : MessageLookupByLibrary.simpleMessage("Error while searching for activity"),
    "home_screen_search_activities_no_results" : MessageLookupByLibrary.simpleMessage("No activity found, try to change the location or area of ​​search"),
    "home_screen_search_activities_tab_name" : MessageLookupByLibrary.simpleMessage("Search"),
    "home_screen_settings_tab_change_language" : MessageLookupByLibrary.simpleMessage("language change:"),
    "home_screen_settings_tab_log_out" : MessageLookupByLibrary.simpleMessage("log out"),
    "home_screen_settings_tab_show_profile" : MessageLookupByLibrary.simpleMessage("show profile"),
    "kilometres_short" : m6,
    "localization_en_US" : MessageLookupByLibrary.simpleMessage("english(USA)"),
    "localization_pl_PL" : MessageLookupByLibrary.simpleMessage("polish(Poland)"),
    "login_error_bad_credentials" : MessageLookupByLibrary.simpleMessage("Incorrect login or password"),
    "login_error_undefined" : MessageLookupByLibrary.simpleMessage("There was an unidentified login problem"),
    "login_screen_change_language_label" : MessageLookupByLibrary.simpleMessage("Change language"),
    "login_screen_email_placeholder" : MessageLookupByLibrary.simpleMessage("E-mail"),
    "login_screen_go_to_register" : MessageLookupByLibrary.simpleMessage("Create account"),
    "login_screen_login" : MessageLookupByLibrary.simpleMessage("Log in"),
    "login_screen_password_placeholder" : MessageLookupByLibrary.simpleMessage("Password"),
    "login_screen_visit_as_a_guest" : MessageLookupByLibrary.simpleMessage("Visit as a guest"),
    "plural_days" : m7,
    "plural_hours" : m8,
    "plural_minutes" : m9,
    "register_error_email_already_in_use" : MessageLookupByLibrary.simpleMessage("Given email is already taken"),
    "register_error_email_weak_password" : MessageLookupByLibrary.simpleMessage("Weak password"),
    "register_error_invalid_email" : MessageLookupByLibrary.simpleMessage("Invalid email"),
    "register_error_operation_not_allowed" : MessageLookupByLibrary.simpleMessage("Operation not allowed"),
    "register_error_undefined" : MessageLookupByLibrary.simpleMessage("There was an unidentified register problem"),
    "register_screen_email_placeholder" : MessageLookupByLibrary.simpleMessage("Pass your email"),
    "register_screen_nav_bar_title" : MessageLookupByLibrary.simpleMessage("Create account"),
    "register_screen_password_placeholder" : MessageLookupByLibrary.simpleMessage("Come up with a password"),
    "register_screen_register" : MessageLookupByLibrary.simpleMessage("Create"),
    "search_area_form_apply_text" : MessageLookupByLibrary.simpleMessage("search"),
    "search_area_form_distance_description" : MessageLookupByLibrary.simpleMessage("The search range determines the radius from which activities will be searched from the point of the previously selected address"),
    "search_area_form_distance_label" : MessageLookupByLibrary.simpleMessage("Distance"),
    "search_area_form_nav_bar_title" : MessageLookupByLibrary.simpleMessage("Search area"),
    "settings" : MessageLookupByLibrary.simpleMessage("settings"),
    "snackbar_create_activity_form_send_error" : MessageLookupByLibrary.simpleMessage("Error creating activity"),
    "snackbar_create_activity_form_send_success" : MessageLookupByLibrary.simpleMessage("The activity was created successfully"),
    "snackbar_form_send_error" : MessageLookupByLibrary.simpleMessage("Error sending the form"),
    "snackbar_form_send_error_success" : MessageLookupByLibrary.simpleMessage("Success in submitting the form"),
    "stepper_cancel_button_text" : MessageLookupByLibrary.simpleMessage("cancel"),
    "stepper_next_button_text" : MessageLookupByLibrary.simpleMessage("next"),
    "text_button_go_to_login" : MessageLookupByLibrary.simpleMessage("go to login"),
    "update_user_form_about_label" : MessageLookupByLibrary.simpleMessage("About"),
    "update_user_form_apply_button" : MessageLookupByLibrary.simpleMessage("submit"),
    "update_user_form_birthday_label" : MessageLookupByLibrary.simpleMessage("Birthday"),
    "update_user_form_first_name_label" : MessageLookupByLibrary.simpleMessage("Name"),
    "update_user_form_gender_label" : MessageLookupByLibrary.simpleMessage("Gender"),
    "update_user_form_nav_bar_title" : MessageLookupByLibrary.simpleMessage("Profile edition"),
    "update_user_form_phone_label" : MessageLookupByLibrary.simpleMessage("Phone"),
    "update_user_form_photo_label" : MessageLookupByLibrary.simpleMessage("Profile photo"),
    "update_user_form_second_name_label" : MessageLookupByLibrary.simpleMessage("Surname"),
    "user_profile_screen_basic_info_about" : MessageLookupByLibrary.simpleMessage("About me"),
    "user_profile_screen_basic_info_age" : MessageLookupByLibrary.simpleMessage("Age"),
    "user_profile_screen_basic_info_email_label" : MessageLookupByLibrary.simpleMessage("Email"),
    "user_profile_screen_basic_info_first_name" : MessageLookupByLibrary.simpleMessage("Name"),
    "user_profile_screen_basic_info_gender" : MessageLookupByLibrary.simpleMessage("Gender"),
    "user_profile_screen_basic_info_phone" : MessageLookupByLibrary.simpleMessage("Phone"),
    "user_profile_screen_basic_info_second_name" : MessageLookupByLibrary.simpleMessage("Surname"),
    "user_profile_screen_basic_info_tab" : MessageLookupByLibrary.simpleMessage("Profile"),
    "user_profile_screen_statistics_as_attendee" : MessageLookupByLibrary.simpleMessage("Activities as a participant:"),
    "user_profile_screen_statistics_as_coorganizer" : MessageLookupByLibrary.simpleMessage("Activities as a co-organizerr:"),
    "user_profile_screen_statistics_as_maker" : MessageLookupByLibrary.simpleMessage("Own activities:"),
    "user_profile_screen_statistics_cancel_involvement" : MessageLookupByLibrary.simpleMessage("Amount of canceled participation in activities:"),
    "user_profile_screen_statistics_nav_bar_title" : MessageLookupByLibrary.simpleMessage("Statistics")
  };
}
