import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../shared/local_database/database_helper.dart';
import '../../../shared/local_database/shared_preferences.dart';

part 'shared_preferences_event.dart';
part 'shared_preferences_state.dart';

class SharedPreferencesBloc
    extends Bloc<SharedPreferencesEvent, SharedPreferencesState> {
  final DatabaseHelper _databaseHelper;
  final SharedPreferences _sharedPreferences;

  SharedPreferencesBloc(this._databaseHelper, this._sharedPreferences)
      : super(SharedPreferencesInitialState());

  @override
  Stream<SharedPreferencesState> mapEventToState(
    SharedPreferencesEvent event,
  ) async* {
    if (event is SharedPreferencesUpdateEvent) {
      yield SharedPreferencesUpdateInProgressState();
      await _databaseHelper.updateUserPreferences(
          event.fieldName, event.fieldValue);
      _sharedPreferences.setPreferencesCode(event.fieldName,
          await _databaseHelper.getUserPreferences(event.fieldName));
      yield SharedPreferencesUpdateSuccessState(
          sharedPreferences: _sharedPreferences);
    } else if (event is SharedPreferencesLocalizationChangeEvent) {
      yield* mapLocalizationChangeEvent(event.locale);
    }
  }

  Stream<SharedPreferencesState> mapLocalizationChangeEvent(
      Locale locale) async* {
    try {
      yield SharedPreferenceLocalizationChangeInProgressState();
      await _databaseHelper.updateUserPreferences(
          SharedPreferencesName.languageCode, locale.languageCode);
      _sharedPreferences.setPreferencesCode(
          SharedPreferencesName.languageCode,
          await _databaseHelper
              .getUserPreferences(SharedPreferencesName.languageCode));
      await _databaseHelper.updateUserPreferences(
          SharedPreferencesName.countryCode, locale.countryCode);
      _sharedPreferences.setPreferencesCode(
          SharedPreferencesName.countryCode,
          await _databaseHelper
              .getUserPreferences(SharedPreferencesName.countryCode));
      yield SharedPreferenceLocalizationChangeSuccessState(locale: locale);
    } catch (e) {
      yield SharedPreferenceLocalizationChangeFailureState(
          message: e.toString());
    }
  }
}
