part of 'filter_option_bloc.dart';

abstract class FilterOptionEvent extends Equatable {
  const FilterOptionEvent();

  @override
  List<Object> get props => [];
}

class FilterOptionUncheckEvent extends FilterOptionEvent {}

class FilterOptionSelectEvent extends FilterOptionEvent {}
