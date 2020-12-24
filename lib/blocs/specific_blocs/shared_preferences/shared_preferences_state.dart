part of 'shared_preferences_bloc.dart';

abstract class SharedPreferencesState extends Equatable {
  const SharedPreferencesState();

  @override
  List<Object> get props => [];
}

class SharedPreferencesInitialState extends SharedPreferencesState {}

class SharedPreferencesUpdateInProgressState extends SharedPreferencesState {}

class SharedPreferencesUpdateSuccessState extends SharedPreferencesState {
  final SharedPreferences sharedPreferences;

  SharedPreferencesUpdateSuccessState({@required this.sharedPreferences});
}

class SharedPreferencesUpdateFailureState extends SharedPreferencesState {}
