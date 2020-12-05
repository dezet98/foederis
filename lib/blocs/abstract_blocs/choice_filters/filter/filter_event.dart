part of 'filter_bloc.dart';

abstract class FilterEvent extends Equatable {
  const FilterEvent();

  @override
  List<Object> get props => [];
}

class FilterChangeEvent extends FilterEvent {
  final FilterOptionBloc filterOptionBloc;

  FilterChangeEvent({@required this.filterOptionBloc});
}
