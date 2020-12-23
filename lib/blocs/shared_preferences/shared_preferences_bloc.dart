import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:engineering_thesis/shared/database_helper.dart';
import 'package:engineering_thesis/shared/shared_preferences.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

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
    }
  }
}
