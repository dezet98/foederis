part of 'filters_bloc.dart';

abstract class FiltersState extends Equatable {
  const FiltersState();

  @override
  List<Object> get props => [];
}

class FiltersInitialState extends FiltersState {}

class FiltersAppliedSuccessState extends FiltersState {}

class FiltersAppliedFailureState extends FiltersState {}

class FiltersApplyingState extends FiltersState {}
