import 'package:engineering_thesis/blocs/abstract_blocs/choice_filters/filter/filter_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/choice_filters/filters/filters_bloc.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:flutter/cupertino.dart';

class SearchActivitiesFiltersBloc extends FiltersBloc<Activity> {
  List<FilterBloc> filters;

  SearchActivitiesFiltersBloc({@required this.filters});

  @override
  List<FilterBloc> get filtersBlocs => filters;
}
