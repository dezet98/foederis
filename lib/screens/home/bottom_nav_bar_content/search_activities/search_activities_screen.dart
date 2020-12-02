import 'package:engineering_thesis/blocs/abstract_blocs/search_filter/search_filter_bloc.dart';
import 'package:engineering_thesis/blocs/geolocation_search_filter_bloc.dart';
import 'package:engineering_thesis/blocs/search_activities_fetching_bloc.dart';
import 'package:engineering_thesis/blocs/search_activity_filters_bloc.dart';
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
  final filtersBloc = SearchActivitiesFiltersBloc();

  @override
  _SearchActivitiesScreenState createState() => _SearchActivitiesScreenState();
}

class _SearchActivitiesScreenState extends State<SearchActivitiesScreen> {
  SearchFilterBloc searchFilterBloc;

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    searchFilterBloc = GeolocationSearchFilterBloc(
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
