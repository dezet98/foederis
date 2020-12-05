import 'package:engineering_thesis/blocs/abstract_blocs/choice_filters/filter_option/filter_option_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/choice_filters/filters/filters_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/choice_filters/multi_choice_filter_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/choice_filters/sort_choice_filter_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/fetch/fetch_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/search_filter/search_filter_bloc.dart';
import 'package:engineering_thesis/blocs/search_activities/search_activities_filters_bloc.dart';
import 'package:engineering_thesis/blocs/search_activities/search_activities_search_filter_bloc.dart';
import 'package:engineering_thesis/blocs/search_activities/search_activities_fetching_bloc.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/shared/builders/fetching_builder.dart';
import 'package:engineering_thesis/shared/builders/filtered_data.dart';
import 'package:engineering_thesis/shared/components/buttons/custom_button.dart';
import 'package:engineering_thesis/shared/components/card/custom_card.dart';
import 'package:engineering_thesis/shared/routing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/builders/custom_search.dart';

class SearchActivitiesScreen extends StatelessWidget {
  // ignore: close_sinks
  //FiltersBloc filtersBloc;

  @override
  Widget build(BuildContext context) {
    // filtersBloc = SearchActivitiesFiltersBloc(
    //   filters: [
    //     SortChoiceFilterBloc<Activity, String>(
    //       options: [
    //         FilterOptionBloc<SortWay>(
    //           filterFieldValue: SortWay.asc,
    //           isSelected: true,
    //           label: S.of(context).filters_screen_filter_value_asc,
    //         ),
    //         FilterOptionBloc<SortWay>(
    //           filterFieldValue: SortWay.desc,
    //           isSelected: false,
    //           label: S.of(context).filters_screen_filter_value_desc,
    //         )
    //       ],
    //       getField: (Activity activity) => activity.title,
    //       filterTitle: S.of(context).filters_screen_filter_subtitile_sort_by,
    //     ),
    //     MultiChoiceFilterBloc<Activity, bool>(
    //       getField: (Activity activity) => activity.regular,
    //       options: [
    //         FilterOptionBloc<bool>(
    //           filterFieldValue: true,
    //           isSelected: true,
    //           label: S.of(context).filters_screen_filter_value_regular,
    //         ),
    //         FilterOptionBloc<bool>(
    //           filterFieldValue: false,
    //           isSelected: true,
    //           label: S.of(context).filters_screen_filter_value_one_time,
    //         )
    //       ],
    //       filterTitle: S.of(context).filters_screen_filter_subtitile_frequency,
    //     )
    //   ],
    // );

    return BlocListener(
      cubit: BlocProvider.of<SearchActivitiesSearchFilterBloc>(context),
      listener: (context, state) {
        if (state is SearchFilterSelectedOptionState) {
          BlocProvider.of<SearchActivitiesFetchingBloc>(context)
              .add(FetchRefreshEvent(filters: [state.fetchFilter]));
        }
      },
      child: CustomScrollView(
        slivers: [
          _buildAppBar(context,
              BlocProvider.of<SearchActivitiesSearchFilterBloc>(context)),
          _buildSearchedActivities(context),
        ],
      ),
    );
  }

  Widget _buildSearchedActivities(context) {
    return FetchingBuilder(
      fetchingCubit: BlocProvider.of<SearchActivitiesFetchingBloc>(context),
      buildSuccess: (activities) {
        return FilteredData<Activity>(
          data: activities,
          filtersBloc: BlocProvider.of<SearchActivitiesFiltersBloc>(context),
          child: _buildActivitiesList,
        );
      },
      buildError: SliverFillRemaining(
        child: Text('Error occur'),
      ),
      buildInProgress: SliverFillRemaining(
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget _buildAppBar(
      BuildContext context, SearchActivitiesSearchFilterBloc searchFilterBloc) {
    return SliverAppBar(
      title: BlocBuilder(
        cubit: searchFilterBloc,
        builder: (context, state) {
          return Text(
            searchFilterBloc.selectedOption != null
                ? searchFilterBloc.display(searchFilterBloc.selectedOption)
                : 'Choose City',
          );
        },
      ),
      elevation: 4,
      actions: [
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              await showSearch<dynamic>(
                context: context,
                delegate: CustomSearch(
                  searchFilterBloc: searchFilterBloc,
                ),
              );
            }),
        CustomButton(
          buttonType: ButtonType.icon_button,
          cupertinoIconData: CupertinoIcons.color_filter,
          materialIconData: Icons.filter_list,
          onPressed: () {
            Routing.pushNamed(
              context,
              CommonRoutes.filter,
              options: BlocProvider.of<SearchActivitiesFiltersBloc>(context),
            );
          },
        )
      ],
    );
  }

  Widget _buildActivitiesList(List<Activity> activities) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [for (Activity activity in activities) _buildActivityTile(activity)],
      ),
    );
  }

  Widget _buildActivityTile(Activity activity) {
    return CustomCard(
      title: activity.title,
      subtitle: activity.categoryRef.toString(),
    );
  }
}
