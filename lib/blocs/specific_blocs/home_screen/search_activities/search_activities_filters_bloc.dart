import 'package:engineering_thesis/blocs/abstract_blocs/choice_filters/filter_option/filter_option_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/choice_filters/filters/filters_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/choice_filters/multi_choice_filter_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/choice_filters/sort_choice_filter_bloc.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/models/activity.dart';

class SearchActivitiesFiltersBloc extends FiltersBloc<Activity> {
  SearchActivitiesFiltersBloc()
      : super(
          [
            SortChoiceFilterBloc<Activity, String>(
              options: [
                FilterOptionBloc<SortWay>(
                  filterFieldValue: SortWay.asc,
                  isSelected: true,
                  getLabel: (context) =>
                      S.of(context).filters_screen_filter_value_asc,
                ),
                FilterOptionBloc<SortWay>(
                  filterFieldValue: SortWay.desc,
                  isSelected: false,
                  getLabel: (context) =>
                      S.of(context).filters_screen_filter_value_desc,
                )
              ],
              getField: (Activity activity) => activity.title,
              getTitle: (context) =>
                  S.of(context).filters_screen_filter_subtitile_sort_by,
            ),
            MultiChoiceFilterBloc<Activity, bool>(
              getField: (Activity activity) => activity.freeJoin,
              options: [
                FilterOptionBloc<bool>(
                  filterFieldValue: true,
                  isSelected: true,
                  getLabel: (context) =>
                      S.of(context).filters_screen_filter_value_free_join,
                ),
                FilterOptionBloc<bool>(
                  filterFieldValue: false,
                  isSelected: true,
                  getLabel: (context) =>
                      S.of(context).filters_screen_filter_value_with_appeal,
                )
              ],
              getTitle: (context) =>
                  S.of(context).filters_screen_filter_value_records_type,
            ),
          ],
        );
}
