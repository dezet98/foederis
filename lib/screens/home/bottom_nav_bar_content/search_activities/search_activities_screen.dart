import 'package:engineering_thesis/blocs/abstract_blocs/choice_filters/filter_option/filter_option_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/choice_filters/filters/filters_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/choice_filters/single_choice_filter_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/choice_filters/sort_choice_filter_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/search_filter/search_filter_bloc.dart';
import 'package:engineering_thesis/blocs/search_activities/search_activities_search_filter_bloc.dart';
import 'package:engineering_thesis/blocs/search_activities/search_activities_fetching_bloc.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/repositories/activity_repository.dart';
import 'package:engineering_thesis/repositories/geolocation_repository.dart';
import 'package:engineering_thesis/shared/builders/fetching_builder.dart';
import 'package:engineering_thesis/shared/routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/builders/custom_search.dart';

class SearchActivitiesScreen extends StatefulWidget {
  // ignore: close_sinks
  final filtersBloc = FiltersBloc(filtersBlocs: [
    SortChoiceFilterBloc<Activity, String>(
      options: [
        FilterOptionBloc<SortWay>(
            filterFieldValue: SortWay.asc, label: 'Rosnąco'),
        FilterOptionBloc<SortWay>(
            filterFieldValue: SortWay.desc, label: 'Malejąco')
      ],
      getField: (Activity activity) => activity.title,
      initialSelected: 0,
    ),
    SingleChoiceFilterBloc<Activity, bool>(
      getField: (Activity activity) => activity.regular,
      initialSelected: 0,
      options: [
        FilterOptionBloc<bool>(filterFieldValue: true, label: 'regular'),
        FilterOptionBloc<bool>(filterFieldValue: false, label: 'one-time')
      ],
    )
  ]);

  @override
  _SearchActivitiesScreenState createState() => _SearchActivitiesScreenState();
}

class _SearchActivitiesScreenState extends State<SearchActivitiesScreen> {
  SearchFilterBloc searchFilterBloc;

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    searchFilterBloc = SearchActivitiesSearchFilterBloc(
      geolocationRepository:
          RepositoryProvider.of<GeolocationRepository>(context),
    );

    return BlocBuilder(
      cubit: searchFilterBloc,
      builder: (context, state) {
        return FetchingBuilder(
          fetchingCubit: SearchActivitiesFetchingBloc(
            activityRepository:
                RepositoryProvider.of<ActivityRepository>(context),
            filters: [searchFilterBloc.fetchFilter],
          ),
          buildSuccess: (activities) {
            return CustomScrollView(
              slivers: [
                _buildAppBar(),
                BlocBuilder(
                  cubit: widget.filtersBloc,
                  builder: (BuildContext context, state) {
                    return _buildActivitiesList(
                      widget.filtersBloc.filter(activities),
                    );
                  },
                ),
              ],
            );
          },
          buildError: CustomScrollView(
            slivers: [_buildAppBar(), CircularProgressIndicator()],
          ),
          buildInProgress: CustomScrollView(
            slivers: [_buildAppBar()],
          ),
        );
      },
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      title: Text(
        searchFilterBloc.selectedOption != null
            ? searchFilterBloc.display(searchFilterBloc.selectedOption)
            : 'Choose City',
      ),
      elevation: 4,
      actions: [
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              await showSearch<dynamic>(
                context: context,
                delegate: CustomSearch(searchFilterBloc: searchFilterBloc),
              );
            }),
        IconButton(
          icon: Icon(Icons.filter_list),
          onPressed: () {
            Routing.pushNamed(context, CommonRoutes.filter,
                options: widget.filtersBloc);
          },
        ),
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
    return Card(
      child: ListTile(
        title: Text(activity.title),
        subtitle: Text(activity.categoryRef.toString()),
      ),
    );
  }
}
