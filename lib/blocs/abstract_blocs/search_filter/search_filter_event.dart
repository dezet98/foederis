part of 'search_filter_bloc.dart';

abstract class SearchFilterEvent extends Equatable {
  const SearchFilterEvent();

  @override
  List<Object> get props => [];
}

class SearchFilterLoadEvent extends SearchFilterEvent {}

class SearchFilterSelectOptionEvent<FilterDataType> extends SearchFilterEvent {
  final FilterDataType selectedElement;

  SearchFilterSelectOptionEvent({@required this.selectedElement});
}
