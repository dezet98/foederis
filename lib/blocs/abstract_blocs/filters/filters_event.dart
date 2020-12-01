part of 'filters_bloc.dart';

abstract class FiltersEvent extends Equatable {
  const FiltersEvent();

  @override
  List<Object> get props => [];
}

class FiltersChangedEvent extends FiltersEvent {}
