import 'package:engineering_thesis/blocs/abstract_blocs/filter/filter_bloc.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'abstract_blocs/filters/filters_bloc.dart';
import 'abstract_blocs/multi_choice_filter/multi_choice_filter_bloc.dart';
import 'abstract_blocs/single_choice_filter/single_choice_filter_bloc.dart';

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
      initialOption: 'disposable',
    ),
    MultiChoiceFilterBloc<String, Activity>(
      options: ['regular', 'disposable'],
      filter: (List<Activity> data, List<String> options) {
        List<Activity> newData = [];
        if (options.contains(SearchActivitiesRegularFilterOptions.regular)) {
          newData.addAll(
              data.where((Activity element) => element.regular).toList());
        }
        if (options.contains(SearchActivitiesRegularFilterOptions.disposable)) {
          newData.addAll(
              data.where((Activity element) => !element.regular).toList());
        }
        return newData;
      },
      display: (dynamic option) => option,
      initialOptions: SearchActivitiesRegularFilterOptions.props,
    )
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
