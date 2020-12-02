import 'package:engineering_thesis/blocs/abstract_blocs/filter/filter_bloc.dart';
import 'package:engineering_thesis/models/activity.dart';
import '../abstract_blocs/filters/filters_bloc.dart';
import '../abstract_blocs/choice_filters/single_choice_filter_bloc.dart';

class SearchActivitiesFiltersBloc extends FiltersBloc<Activity> {
  final String Function(String) display = (String data) => data;

  List<FilterBloc> filters = [
    SingleChoiceFilterBloc<String, Activity>(
      options: ['regular', 'disposable'],
      filter: (List<Activity> data, String option) {
        if (option == SearchActivitiesRegularFilterOptions.regular) {
          return data.where((Activity element) => element.regular).toList();
        } else if (option == SearchActivitiesRegularFilterOptions.disposable) {
          return data.where((Activity element) => !element.regular).toList();
        }
        return data;
      },
      display: (dynamic data) => data,
      filterLabel: 'Activity status',
      initialOption: 'disposable',
    ),
    SingleChoiceFilterBloc<String, Activity>(
        options: ['asc', 'desc'],
        filter: (List<Activity> data, String option) {
          if (option == 'asc') {
            data.sort((a, b) => a.title.compareTo(b.title));
            return data;
          } else if (option == 'desc') {
            data.sort((a, b) => b.title.compareTo(a.title));
            return data;
          }
          return data;
        },
        display: (dynamic data) => data,
        initialOption: 'asc',
        filterLabel: 'Sort by'),
  ];

  @override
  List<FilterBloc> getFilters() {
    return filters;
  }
}

class SearchActivitiesRegularFilterOptions {
  static String regular = 'regular';
  static String disposable = 'disposable';

  static List<String> get props => [regular, disposable];
}
