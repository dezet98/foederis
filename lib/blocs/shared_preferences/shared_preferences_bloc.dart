import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:engineering_thesis/models/shared_preferences.dart';
import 'package:engineering_thesis/shared/database_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'shared_preferences_event.dart';
part 'shared_preferences_state.dart';

class SharedPreferencesBloc
    extends Bloc<SharedPreferencesEvent, SharedPreferencesState> {
  final DatabaseHelper _databaseHelper;

  SharedPreferences sharedPreferences;

  SharedPreferencesBloc(this._databaseHelper)
      : super(SharedPreferencesInitialState()) {
    add(SharedPreferencesLoadEvent());
  }

  @override
  Stream<SharedPreferencesState> mapEventToState(
    SharedPreferencesEvent event,
  ) async* {
    if (event is SharedPreferencesLoadEvent) {
      yield SharedPreferencesLoadInProgressState();
      sharedPreferences = await _databaseHelper.getSearchActivityView();
      yield SharedPreferencesLoadSuccessState(
          sharedPreferences: sharedPreferences);
    } else if (event is SharedPreferencesUpdateEvent) {
      yield SharedPreferencesUpdateInProgressState();
      await _databaseHelper.updateSearchActivityView(
          event.fieldName, event.fieldValue);
      sharedPreferences = await _databaseHelper.getSearchActivityView();
      yield SharedPreferencesUpdateSuccessState(
          sharedPreferences: sharedPreferences);
    }
  }
}
