part of 'search_filter_bloc.dart';

abstract class SearchFilterState extends Equatable {
  const SearchFilterState();

  @override
  List<Object> get props => [];
}

class SearchFilterInitialState extends SearchFilterState {}

class SearchFilterLoadDataInProgressState extends SearchFilterState {}

class SearchFilterLoadDataSuccessState extends SearchFilterState {}

class SearchFilterLoadDataFailureState extends SearchFilterState {
  final String message;

  SearchFilterLoadDataFailureState({this.message});

  @override
  String toString() => 'SearchFilterLoadDataFailureState {error: $message}';
}

class SearchFilterSelectOptionInProgressState extends SearchFilterState {}

class SearchFilterSelectedOptionState<SelectedOption>
    extends SearchFilterState {
  final SelectedOption selectedOption;

  SearchFilterSelectedOptionState({this.selectedOption});
}

class SearchFilterSelectOptionFailureState extends SearchFilterState {
  final String message;

  SearchFilterSelectOptionFailureState({this.message});

  @override
  String toString() => 'SearchFilterSelectOptionFailureState {error: $message}';
}
