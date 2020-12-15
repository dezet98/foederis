part of 'shared_preferences_bloc.dart';

abstract class SharedPreferencesEvent extends Equatable {
  const SharedPreferencesEvent();

  @override
  List<Object> get props => [];
}

class SharedPreferencesUpdateEvent extends SharedPreferencesEvent {
  final String fieldName;
  final String fieldValue;

  SharedPreferencesUpdateEvent(this.fieldName, this.fieldValue);
}
