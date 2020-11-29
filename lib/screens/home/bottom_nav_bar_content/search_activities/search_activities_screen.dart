import 'package:engineering_thesis/blocs/geolocation_search_filter_bloc.dart';
import 'package:engineering_thesis/blocs/search_activities_fetching_bloc.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/models/geolocation.dart';
import 'package:engineering_thesis/repositories/activity_repository.dart';
import 'package:engineering_thesis/repositories/geolocation_repository.dart';
import 'package:engineering_thesis/shared/components/fetching_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/components/search_bar/custom_search.dart';

class SearchActivitiesScreen extends StatefulWidget {
  @override
  _SearchActivitiesScreenState createState() => _SearchActivitiesScreenState();
}

class _SearchActivitiesScreenState extends State<SearchActivitiesScreen> {
  Geolocation geoFiltr;

  @override
  Widget build(BuildContext context) {
    return FetchingBuilder(
      fetchingCubit: SearchActivitiesFetchingBloc(
        activityRepository: RepositoryProvider.of<ActivityRepository>(context),
      ),
      buildSuccess: (activities) {
        return CustomScrollView(
          slivers: [
            _buildAppBar(),
            _buildActivitiesList(activities),
          ],
        );
      },
      buildError: CustomScrollView(
        slivers: [_buildAppBar(), Text('Error')],
      ),
      buildInProgress: CustomScrollView(
        slivers: [_buildAppBar(), Text('Load')],
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      title: Text(geoFiltr == null ? 'Choose city' : geoFiltr.city),
      elevation: 4,
      actions: [
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              var newGeoFiltr = await showSearch<dynamic>(
                context: context,
                delegate: CustomSearch(
                  searchFilterBloc: GeolocationSearchFilterBloc(
                    geolocationRepository:
                        RepositoryProvider.of<GeolocationRepository>(context),
                  ),
                ),
              );
              if (newGeoFiltr != null)
                setState(() {
                  geoFiltr = newGeoFiltr;
                });
            }),
        IconButton(
          icon: Icon(Icons.filter_list),
          onPressed: () {},
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
