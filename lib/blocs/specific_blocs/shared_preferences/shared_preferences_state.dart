part of 'shared_preferences_bloc.dart';

abstract class SharedPreferencesState extends Equatable {
  const SharedPreferencesState();

  @override
  List<Object> get props => [];
}

/// common
class SharedPreferencesInitialState extends SharedPreferencesState {}

class SharedPreferencesUpdateInProgressState extends SharedPreferencesState {}

class SharedPreferencesUpdateSuccessState extends SharedPreferencesState {
  final SharedPreferences sharedPreferences;

  SharedPreferencesUpdateSuccessState({@required this.sharedPreferences});
}

class SharedPreferencesUpdateFailureState extends SharedPreferencesState {}

/// for localization
class SharedPreferenceLocalizationChangeInProgressState
    extends SharedPreferencesState {}

class SharedPreferenceLocalizationChangeSuccessState
    extends SharedPreferencesState {
  final Locale locale;

  SharedPreferenceLocalizationChangeSuccessState({@required this.locale});
}

class SharedPreferenceLocalizationChangeFailureState
    extends SharedPreferencesState {
  final String message;

  SharedPreferenceLocalizationChangeFailureState({@required this.message});
}
