import 'package:flutter/cupertino.dart';

import '../../../models/activity.dart';
import '../../abstract_blocs/choice_filters/filter/filter_bloc.dart';
import '../../abstract_blocs/choice_filters/filters/filters_bloc.dart';

class SearchActivitiesFiltersBloc extends FiltersBloc<Activity> {
  List<FilterBloc> filters;

  SearchActivitiesFiltersBloc({@required this.filters});

  @override
  List<FilterBloc> get filtersBlocs => filters;
}
