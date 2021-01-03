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

  /// `Log in`
  String get login_screen_login {
    return Intl.message(
      'Log in',
      name: 'login_screen_login',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get login_screen_go_to_register {
    return Intl.message(
      'Create account',
      name: 'login_screen_go_to_register',
      desc: '',
      args: [],
    );
  }

  /// `Visit as a guest`
  String get login_screen_visit_as_a_guest {
    return Intl.message(
      'Visit as a guest',
      name: 'login_screen_visit_as_a_guest',
      desc: '',
      args: [],
    );
  }

  /// `E-mail`
  String get login_screen_email_placeholder {
    return Intl.message(
      'E-mail',
      name: 'login_screen_email_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get login_screen_password_placeholder {
    return Intl.message(
      'Password',
      name: 'login_screen_password_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get register_screen_register {
    return Intl.message(
      'Create',
      name: 'register_screen_register',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get register_screen_nav_bar_title {
    return Intl.message(
      'Create account',
      name: 'register_screen_nav_bar_title',
      desc: '',
      args: [],
    );
  }

  /// `Pass your email`
  String get register_screen_email_placeholder {
    return Intl.message(
      'Pass your email',
      name: 'register_screen_email_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Come up with a password`
  String get register_screen_password_placeholder {
    return Intl.message(
      'Come up with a password',
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

  /// `No activity found, try to change the location or area of ​​search`
  String get home_screen_search_activities_no_results {
    return Intl.message(
      'No activity found, try to change the location or area of ​​search',
      name: 'home_screen_search_activities_no_results',
      desc: '',
      args: [],
    );
  }

  /// `Error while searching for activity`
  String get home_screen_search_activities_error {
    return Intl.message(
      'Error while searching for activity',
      name: 'home_screen_search_activities_error',
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

  /// `My activities`
  String get home_screen_my_activity_tab_name {
    return Intl.message(
      'My activities',
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

  /// `Sort by name`
  String get filters_screen_filter_subtitile_sort_by {
    return Intl.message(
      'Sort by name',
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

  /// `Type of records`
  String get filters_screen_filter_value_records_type {
    return Intl.message(
      'Type of records',
      name: 'filters_screen_filter_value_records_type',
      desc: '',
      args: [],
    );
  }

  /// `free join records`
  String get filters_screen_filter_value_free_join {
    return Intl.message(
      'free join records',
      name: 'filters_screen_filter_value_free_join',
      desc: '',
      args: [],
    );
  }

  /// `for approval`
  String get filters_screen_filter_value_with_appeal {
    return Intl.message(
      'for approval',
      name: 'filters_screen_filter_value_with_appeal',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect login or password`
  String get login_error_bad_credentials {
    return Intl.message(
      'Incorrect login or password',
      name: 'login_error_bad_credentials',
      desc: '',
      args: [],
    );
  }

  /// `There was an unidentified login problem`
  String get login_error_undefined {
    return Intl.message(
      'There was an unidentified login problem',
      name: 'login_error_undefined',
      desc: '',
      args: [],
    );
  }

  /// `There was an unidentified register problem`
  String get register_error_undefined {
    return Intl.message(
      'There was an unidentified register problem',
      name: 'register_error_undefined',
      desc: '',
      args: [],
    );
  }

  /// `Given email is already taken`
  String get register_error_email_already_in_use {
    return Intl.message(
      'Given email is already taken',
      name: 'register_error_email_already_in_use',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email`
  String get register_error_invalid_email {
    return Intl.message(
      'Invalid email',
      name: 'register_error_invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `Weak password`
  String get register_error_email_weak_password {
    return Intl.message(
      'Weak password',
      name: 'register_error_email_weak_password',
      desc: '',
      args: [],
    );
  }

  /// `Operation not allowed`
  String get register_error_operation_not_allowed {
    return Intl.message(
      'Operation not allowed',
      name: 'register_error_operation_not_allowed',
      desc: '',
      args: [],
    );
  }

  /// `To fully use the application, log in or create an account`
  String get guest_prohibited_access_info {
    return Intl.message(
      'To fully use the application, log in or create an account',
      name: 'guest_prohibited_access_info',
      desc: '',
      args: [],
    );
  }

  /// `To be able to create your own activities, view and participate in others, join us now!`
  String get guest_prohibited_access_info_tab_content {
    return Intl.message(
      'To be able to create your own activities, view and participate in others, join us now!',
      name: 'guest_prohibited_access_info_tab_content',
      desc: '',
      args: [],
    );
  }

  /// `Access denied`
  String get guest_prohibited_access_title {
    return Intl.message(
      'Access denied',
      name: 'guest_prohibited_access_title',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get guest_prohibited_go_to_login {
    return Intl.message(
      'Log in',
      name: 'guest_prohibited_go_to_login',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get guest_prohibited_go_to_register {
    return Intl.message(
      'Register',
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

  /// `free join`
  String get activity_card_free_join {
    return Intl.message(
      'free join',
      name: 'activity_card_free_join',
      desc: '',
      args: [],
    );
  }

  /// `records`
  String get activity_card_registration {
    return Intl.message(
      'records',
      name: 'activity_card_registration',
      desc: '',
      args: [],
    );
  }

  /// `finish`
  String get activity_card_complete {
    return Intl.message(
      'finish',
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

  /// `{howManyMinutes,plural, =1{{howManyMinutes} minute}=2{{howManyMinutes} minutes}other{{howManyMinutes} minutes}}`
  String plural_minutes(num howManyMinutes) {
    return Intl.plural(
      howManyMinutes,
      one: '$howManyMinutes minute',
      two: '$howManyMinutes minutes',
      other: '$howManyMinutes minutes',
      name: 'plural_minutes',
      desc: '',
      args: [howManyMinutes],
    );
  }

  /// `{howManyHours,plural, =1{{howManyHours} hour}=2{{howManyHours} hours}other{{howManyHours} hours}}`
  String plural_hours(num howManyHours) {
    return Intl.plural(
      howManyHours,
      one: '$howManyHours hour',
      two: '$howManyHours hours',
      other: '$howManyHours hours',
      name: 'plural_hours',
      desc: '',
      args: [howManyHours],
    );
  }

  /// `{howManyDays,plural, =1{{howManyDays} day}other{{howManyDays} days}}`
  String plural_days(num howManyDays) {
    return Intl.plural(
      howManyDays,
      one: '$howManyDays day',
      other: '$howManyDays days',
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

  /// `title`
  String get create_activity_screen_title_placeholder {
    return Intl.message(
      'title',
      name: 'create_activity_screen_title_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Activity title`
  String get create_activity_screen_title_label {
    return Intl.message(
      'Activity title',
      name: 'create_activity_screen_title_label',
      desc: '',
      args: [],
    );
  }

  /// `No attendees approval`
  String get create_activity_screen_free_join_label {
    return Intl.message(
      'No attendees approval',
      name: 'create_activity_screen_free_join_label',
      desc: '',
      args: [],
    );
  }

  /// `Without approval of participants, it will make everyone who signs up for the activity a participant. Otherwise, it can send a request to join which you must accept`
  String get create_activity_screen_free_join_description {
    return Intl.message(
      'Without approval of participants, it will make everyone who signs up for the activity a participant. Otherwise, it can send a request to join which you must accept',
      name: 'create_activity_screen_free_join_description',
      desc: '',
      args: [],
    );
  }

  /// `Start date`
  String get create_activity_screen_start_date_label {
    return Intl.message(
      'Start date',
      name: 'create_activity_screen_start_date_label',
      desc: '',
      args: [],
    );
  }

  /// `A number of participants`
  String get create_activity_screen_min_max_entry_label {
    return Intl.message(
      'A number of participants',
      name: 'create_activity_screen_min_max_entry_label',
      desc: '',
      args: [],
    );
  }

  /// `Determining the number of participants who can enroll in an activity without the required number of participants will be considered not completed.`
  String get create_activity_screen_min_max_entry_description {
    return Intl.message(
      'Determining the number of participants who can enroll in an activity without the required number of participants will be considered not completed.',
      name: 'create_activity_screen_min_max_entry_description',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get create_activity_screen_category_label {
    return Intl.message(
      'Category',
      name: 'create_activity_screen_category_label',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get create_activity_screen_address_label {
    return Intl.message(
      'Address',
      name: 'create_activity_screen_address_label',
      desc: '',
      args: [],
    );
  }

  /// `Activity address, it is important to enter the correct address because users search for activity based on location`
  String get create_activity_screen_address_description {
    return Intl.message(
      'Activity address, it is important to enter the correct address because users search for activity based on location',
      name: 'create_activity_screen_address_description',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get create_activity_screen_description_label {
    return Intl.message(
      'Description',
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

  /// `Profile edition`
  String get update_user_form_nav_bar_title {
    return Intl.message(
      'Profile edition',
      name: 'update_user_form_nav_bar_title',
      desc: '',
      args: [],
    );
  }

  /// `submit`
  String get update_user_form_apply_button {
    return Intl.message(
      'submit',
      name: 'update_user_form_apply_button',
      desc: '',
      args: [],
    );
  }

  /// `Profile photo`
  String get update_user_form_photo_label {
    return Intl.message(
      'Profile photo',
      name: 'update_user_form_photo_label',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get update_user_form_first_name_label {
    return Intl.message(
      'Name',
      name: 'update_user_form_first_name_label',
      desc: '',
      args: [],
    );
  }

  /// `Surname`
  String get update_user_form_second_name_label {
    return Intl.message(
      'Surname',
      name: 'update_user_form_second_name_label',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get update_user_form_about_label {
    return Intl.message(
      'About',
      name: 'update_user_form_about_label',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get update_user_form_phone_label {
    return Intl.message(
      'Phone',
      name: 'update_user_form_phone_label',
      desc: '',
      args: [],
    );
  }

  /// `Birthday`
  String get update_user_form_birthday_label {
    return Intl.message(
      'Birthday',
      name: 'update_user_form_birthday_label',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get update_user_form_gender_label {
    return Intl.message(
      'Gender',
      name: 'update_user_form_gender_label',
      desc: '',
      args: [],
    );
  }

  /// `next`
  String get stepper_next_button_text {
    return Intl.message(
      'next',
      name: 'stepper_next_button_text',
      desc: '',
      args: [],
    );
  }

  /// `cancel`
  String get stepper_cancel_button_text {
    return Intl.message(
      'cancel',
      name: 'stepper_cancel_button_text',
      desc: '',
      args: [],
    );
  }

  /// `Details for the field {validatorName}`
  String form_field_info_dialog_title(Object validatorName) {
    return Intl.message(
      'Details for the field $validatorName',
      name: 'form_field_info_dialog_title',
      desc: '',
      args: [validatorName],
    );
  }

  /// `value must be an integer`
  String get form_field_info_digits_validator {
    return Intl.message(
      'value must be an integer',
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

  /// `the length of a given expression should be within the range <{min}, {max}>`
  String form_field_info_numbers_range_validator(Object min, Object max) {
    return Intl.message(
      'the length of a given expression should be within the range <$min, $max>',
      name: 'form_field_info_numbers_range_validator',
      desc: '',
      args: [min, max],
    );
  }

  /// `date must be before {minDate} and after {maxDate}`
  String form_field_info_date_time_range_validator(Object minDate, Object maxDate) {
    return Intl.message(
      'date must be before $minDate and after $maxDate',
      name: 'form_field_info_date_time_range_validator',
      desc: '',
      args: [minDate, maxDate],
    );
  }

  /// `mandatory field`
  String get form_field_info_not_null_validator {
    return Intl.message(
      'mandatory field',
      name: 'form_field_info_not_null_validator',
      desc: '',
      args: [],
    );
  }

  /// `phone number must be in the form xxx xxx xxx`
  String get form_field_info_phone_validator {
    return Intl.message(
      'phone number must be in the form xxx xxx xxx',
      name: 'form_field_info_phone_validator',
      desc: '',
      args: [],
    );
  }

  /// `the condition must be met: value1 {character} value2`
  String form_field_info_numbers_validator(Object character) {
    return Intl.message(
      'the condition must be met: value1 $character value2',
      name: 'form_field_info_numbers_validator',
      desc: '',
      args: [character],
    );
  }

  /// `description`
  String get form_field_info_additional_info {
    return Intl.message(
      'description',
      name: 'form_field_info_additional_info',
      desc: '',
      args: [],
    );
  }

  /// `validation`
  String get form_field_info_additional_validation {
    return Intl.message(
      'validation',
      name: 'form_field_info_additional_validation',
      desc: '',
      args: [],
    );
  }

  /// `choose date`
  String get date_time_picker_text {
    return Intl.message(
      'choose date',
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

  /// `man`
  String get gender_male {
    return Intl.message(
      'man',
      name: 'gender_male',
      desc: '',
      args: [],
    );
  }

  /// `female`
  String get gender_female {
    return Intl.message(
      'female',
      name: 'gender_female',
      desc: '',
      args: [],
    );
  }

  /// `prefere not to say`
  String get gender_prefer_not_to_say {
    return Intl.message(
      'prefere not to say',
      name: 'gender_prefer_not_to_say',
      desc: '',
      args: [],
    );
  }

  /// `choose photo`
  String get form_field_photo_choose_photo {
    return Intl.message(
      'choose photo',
      name: 'form_field_photo_choose_photo',
      desc: '',
      args: [],
    );
  }

  /// `english(USA)`
  String get localization_en_US {
    return Intl.message(
      'english(USA)',
      name: 'localization_en_US',
      desc: '',
      args: [],
    );
  }

  /// `polish(Poland)`
  String get localization_pl_PL {
    return Intl.message(
      'polish(Poland)',
      name: 'localization_pl_PL',
      desc: '',
      args: [],
    );
  }

  /// `log out`
  String get home_screen_settings_tab_log_out {
    return Intl.message(
      'log out',
      name: 'home_screen_settings_tab_log_out',
      desc: '',
      args: [],
    );
  }

  /// `show profile`
  String get home_screen_settings_tab_show_profile {
    return Intl.message(
      'show profile',
      name: 'home_screen_settings_tab_show_profile',
      desc: '',
      args: [],
    );
  }

  /// `language change:`
  String get home_screen_settings_tab_change_language {
    return Intl.message(
      'language change:',
      name: 'home_screen_settings_tab_change_language',
      desc: '',
      args: [],
    );
  }

  /// `Search area`
  String get search_area_form_nav_bar_title {
    return Intl.message(
      'Search area',
      name: 'search_area_form_nav_bar_title',
      desc: '',
      args: [],
    );
  }

  /// `search`
  String get search_area_form_apply_text {
    return Intl.message(
      'search',
      name: 'search_area_form_apply_text',
      desc: '',
      args: [],
    );
  }

  /// `Distance`
  String get search_area_form_distance_label {
    return Intl.message(
      'Distance',
      name: 'search_area_form_distance_label',
      desc: '',
      args: [],
    );
  }

  /// `The search range determines the radius from which activities will be searched from the point of the previously selected address`
  String get search_area_form_distance_description {
    return Intl.message(
      'The search range determines the radius from which activities will be searched from the point of the previously selected address',
      name: 'search_area_form_distance_description',
      desc: '',
      args: [],
    );
  }

  /// `maker`
  String get activity_role_maker {
    return Intl.message(
      'maker',
      name: 'activity_role_maker',
      desc: '',
      args: [],
    );
  }

  /// `co-organizer`
  String get activity_role_coorganizator {
    return Intl.message(
      'co-organizer',
      name: 'activity_role_coorganizator',
      desc: '',
      args: [],
    );
  }

  /// `attendee`
  String get activity_role_attendee {
    return Intl.message(
      'attendee',
      name: 'activity_role_attendee',
      desc: '',
      args: [],
    );
  }

  /// `Error sending the form`
  String get snackbar_form_send_error {
    return Intl.message(
      'Error sending the form',
      name: 'snackbar_form_send_error',
      desc: '',
      args: [],
    );
  }

  /// `Error creating activity`
  String get snackbar_create_activity_form_send_error {
    return Intl.message(
      'Error creating activity',
      name: 'snackbar_create_activity_form_send_error',
      desc: '',
      args: [],
    );
  }

  /// `The activity was created successfully`
  String get snackbar_create_activity_form_send_success {
    return Intl.message(
      'The activity was created successfully',
      name: 'snackbar_create_activity_form_send_success',
      desc: '',
      args: [],
    );
  }

  /// `Success in submitting the form`
  String get snackbar_form_send_error_success {
    return Intl.message(
      'Success in submitting the form',
      name: 'snackbar_form_send_error_success',
      desc: '',
      args: [],
    );
  }

  /// `Attendees`
  String get activity_details_screen_attendee_tab_nav_bar_title {
    return Intl.message(
      'Attendees',
      name: 'activity_details_screen_attendee_tab_nav_bar_title',
      desc: '',
      args: [],
    );
  }

  /// `Give co-organizer rights`
  String get activity_details_screen_attendee_tab_grant_organizator_grants {
    return Intl.message(
      'Give co-organizer rights',
      name: 'activity_details_screen_attendee_tab_grant_organizator_grants',
      desc: '',
      args: [],
    );
  }

  /// `Take away the rights of the co-organizer`
  String get activity_details_screen_attendee_tab_give_organizator_rights_up {
    return Intl.message(
      'Take away the rights of the co-organizer',
      name: 'activity_details_screen_attendee_tab_give_organizator_rights_up',
      desc: '',
      args: [],
    );
  }

  /// `date of joining:`
  String get activity_details_screen_attendee_tab_join_date {
    return Intl.message(
      'date of joining:',
      name: 'activity_details_screen_attendee_tab_join_date',
      desc: '',
      args: [],
    );
  }

  /// `role:`
  String get activity_details_screen_attendee_tab_role {
    return Intl.message(
      'role:',
      name: 'activity_details_screen_attendee_tab_role',
      desc: '',
      args: [],
    );
  }

  /// `Map`
  String get activity_details_screen_map_tab_nav_bar_title {
    return Intl.message(
      'Map',
      name: 'activity_details_screen_map_tab_nav_bar_title',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get activity_details_screen_details_tab_nav_bar_title {
    return Intl.message(
      'Details',
      name: 'activity_details_screen_details_tab_nav_bar_title',
      desc: '',
      args: [],
    );
  }

  /// `The nature of the records`
  String get activity_details_screen_details_tab_records_label {
    return Intl.message(
      'The nature of the records',
      name: 'activity_details_screen_details_tab_records_label',
      desc: '',
      args: [],
    );
  }

  /// `free`
  String get activity_details_screen_details_tab_records_free_join {
    return Intl.message(
      'free',
      name: 'activity_details_screen_details_tab_records_free_join',
      desc: '',
      args: [],
    );
  }

  /// `requiring approval`
  String get activity_details_screen_details_tab_records_with_appeal {
    return Intl.message(
      'requiring approval',
      name: 'activity_details_screen_details_tab_records_with_appeal',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get activity_details_screen_details_tab_address {
    return Intl.message(
      'Address',
      name: 'activity_details_screen_details_tab_address',
      desc: '',
      args: [],
    );
  }

  /// `Number of attendees`
  String get activity_details_screen_details_tab_attendees_label {
    return Intl.message(
      'Number of attendees',
      name: 'activity_details_screen_details_tab_attendees_label',
      desc: '',
      args: [],
    );
  }

  /// `Possible number of attendees`
  String get activity_details_screen_details_tab_attendees_range_label {
    return Intl.message(
      'Possible number of attendees',
      name: 'activity_details_screen_details_tab_attendees_range_label',
      desc: '',
      args: [],
    );
  }

  /// `From {min} to {max}`
  String activity_details_screen_details_tab_attendees_range(Object min, Object max) {
    return Intl.message(
      'From $min to $max',
      name: 'activity_details_screen_details_tab_attendees_range',
      desc: '',
      args: [min, max],
    );
  }

  /// `About activity`
  String get activity_details_screen_details_tab_description {
    return Intl.message(
      'About activity',
      name: 'activity_details_screen_details_tab_description',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get activity_details_screen_details_tab_status {
    return Intl.message(
      'Status',
      name: 'activity_details_screen_details_tab_status',
      desc: '',
      args: [],
    );
  }

  /// `Start date`
  String get activity_details_screen_details_tab_start_date {
    return Intl.message(
      'Start date',
      name: 'activity_details_screen_details_tab_start_date',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get activity_details_screen_details_tab_category {
    return Intl.message(
      'Category',
      name: 'activity_details_screen_details_tab_category',
      desc: '',
      args: [],
    );
  }

  /// `Records`
  String get activity_details_screen_free_join_tab_nav_bar_title {
    return Intl.message(
      'Records',
      name: 'activity_details_screen_free_join_tab_nav_bar_title',
      desc: '',
      args: [],
    );
  }

  /// `Join to activity`
  String get activity_details_screen_free_join_tab_join_button {
    return Intl.message(
      'Join to activity',
      name: 'activity_details_screen_free_join_tab_join_button',
      desc: '',
      args: [],
    );
  }

  /// `Requests to join`
  String get activity_details_screen_requests_tab_join_title {
    return Intl.message(
      'Requests to join',
      name: 'activity_details_screen_requests_tab_join_title',
      desc: '',
      args: [],
    );
  }

  /// `accept the request to join`
  String get activity_details_screen_requests_tab_accept_request {
    return Intl.message(
      'accept the request to join',
      name: 'activity_details_screen_requests_tab_accept_request',
      desc: '',
      args: [],
    );
  }

  /// `cancel the request to join`
  String get activity_details_screen_records_cancel_request {
    return Intl.message(
      'cancel the request to join',
      name: 'activity_details_screen_records_cancel_request',
      desc: '',
      args: [],
    );
  }

  /// `Records`
  String get activity_details_screen_records_nav_bar_tab {
    return Intl.message(
      'Records',
      name: 'activity_details_screen_records_nav_bar_tab',
      desc: '',
      args: [],
    );
  }

  /// `ask to join the activity`
  String get activity_details_screen_records_send_appeal {
    return Intl.message(
      'ask to join the activity',
      name: 'activity_details_screen_records_send_appeal',
      desc: '',
      args: [],
    );
  }

  /// `Your request is awaiting the decision of the organizer`
  String get activity_details_screen_records_cancel_info {
    return Intl.message(
      'Your request is awaiting the decision of the organizer',
      name: 'activity_details_screen_records_cancel_info',
      desc: '',
      args: [],
    );
  }

  /// `No requests to join the activity`
  String get activity_details_screen_request_tab_no_results {
    return Intl.message(
      'No requests to join the activity',
      name: 'activity_details_screen_request_tab_no_results',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get appeal_join_form_comment_label {
    return Intl.message(
      'Message',
      name: 'appeal_join_form_comment_label',
      desc: '',
      args: [],
    );
  }

  /// `Comment to request`
  String get appeal_join_form_comment_placeholder {
    return Intl.message(
      'Comment to request',
      name: 'appeal_join_form_comment_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Change language`
  String get login_screen_change_language_label {
    return Intl.message(
      'Change language',
      name: 'login_screen_change_language_label',
      desc: '',
      args: [],
    );
  }

  /// `cancel activity`
  String get activity_details_screen_cancel_activity_button_text {
    return Intl.message(
      'cancel activity',
      name: 'activity_details_screen_cancel_activity_button_text',
      desc: '',
      args: [],
    );
  }

  /// `cancel participation in the activity`
  String get activity_details_screen_cancel_involvement_button_text {
    return Intl.message(
      'cancel participation in the activity',
      name: 'activity_details_screen_cancel_involvement_button_text',
      desc: '',
      args: [],
    );
  }

  /// `canceled`
  String get activity_cancel_status {
    return Intl.message(
      'canceled',
      name: 'activity_cancel_status',
      desc: '',
      args: [],
    );
  }

  /// `during registration`
  String get activity_open_status {
    return Intl.message(
      'during registration',
      name: 'activity_open_status',
      desc: '',
      args: [],
    );
  }

  /// `finished`
  String get activity_finish_status {
    return Intl.message(
      'finished',
      name: 'activity_finish_status',
      desc: '',
      args: [],
    );
  }

  /// `no places`
  String get activity_no_places_status {
    return Intl.message(
      'no places',
      name: 'activity_no_places_status',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get user_profile_screen_basic_info_tab {
    return Intl.message(
      'Profile',
      name: 'user_profile_screen_basic_info_tab',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get user_profile_screen_basic_info_email_label {
    return Intl.message(
      'Email',
      name: 'user_profile_screen_basic_info_email_label',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get user_profile_screen_basic_info_first_name {
    return Intl.message(
      'Name',
      name: 'user_profile_screen_basic_info_first_name',
      desc: '',
      args: [],
    );
  }

  /// `Surname`
  String get user_profile_screen_basic_info_second_name {
    return Intl.message(
      'Surname',
      name: 'user_profile_screen_basic_info_second_name',
      desc: '',
      args: [],
    );
  }

  /// `About me`
  String get user_profile_screen_basic_info_about {
    return Intl.message(
      'About me',
      name: 'user_profile_screen_basic_info_about',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get user_profile_screen_basic_info_gender {
    return Intl.message(
      'Gender',
      name: 'user_profile_screen_basic_info_gender',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get user_profile_screen_basic_info_age {
    return Intl.message(
      'Age',
      name: 'user_profile_screen_basic_info_age',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get user_profile_screen_basic_info_phone {
    return Intl.message(
      'Phone',
      name: 'user_profile_screen_basic_info_phone',
      desc: '',
      args: [],
    );
  }

  /// `Statistics`
  String get user_profile_screen_statistics_nav_bar_title {
    return Intl.message(
      'Statistics',
      name: 'user_profile_screen_statistics_nav_bar_title',
      desc: '',
      args: [],
    );
  }

  /// `Own activities:`
  String get user_profile_screen_statistics_as_maker {
    return Intl.message(
      'Own activities:',
      name: 'user_profile_screen_statistics_as_maker',
      desc: '',
      args: [],
    );
  }

  /// `Activities as a co-organizerr:`
  String get user_profile_screen_statistics_as_coorganizer {
    return Intl.message(
      'Activities as a co-organizerr:',
      name: 'user_profile_screen_statistics_as_coorganizer',
      desc: '',
      args: [],
    );
  }

  /// `Activities as a participant:`
  String get user_profile_screen_statistics_as_attendee {
    return Intl.message(
      'Activities as a participant:',
      name: 'user_profile_screen_statistics_as_attendee',
      desc: '',
      args: [],
    );
  }

  /// `Amount of canceled participation in activities:`
  String get user_profile_screen_statistics_cancel_involvement {
    return Intl.message(
      'Amount of canceled participation in activities:',
      name: 'user_profile_screen_statistics_cancel_involvement',
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