import 'package:engineering_thesis/blocs/specific_blocs/home_screen/search_activities/search_activities_fetching_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/home_screen/search_activities/search_activities_filters_bloc.dart';
import 'package:engineering_thesis/components/bloc_builders/cards/activity_card.dart';
import 'package:engineering_thesis/components/bloc_builders/fetching_bloc_builder.dart';
import 'package:engineering_thesis/components/bloc_builders/filters/filtered_data.dart';
import 'package:engineering_thesis/components/custom_widgets/bottom_sheet/custom_bottom_sheet.dart';
import 'package:engineering_thesis/components/custom_widgets/maps/custom_cluster_google_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geohash/geohash.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../models/activity.dart';
import '../../../../shared/shared_preferences.dart';
import 'search_activity_app_bar.dart';

class SearchActivityMapView extends StatelessWidget {
  final Function(BuildContext) onRefresh;

  SearchActivityMapView({@required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchActivitiesAppBar.getAppBar(context),
      body: _fetchActivities(context),
    );
  }

  Widget _fetchActivities(BuildContext context) {
    return FetchingBlocBuilder(
      fetchingCubit: BlocProvider.of<SearchActivitiesFetchingBloc>(context),
      buildSuccess: (activities) => _filtersActivities(context, activities),
      buildError: (error) => Text('error'),
      buildInProgress: CircularProgressIndicator(),
    );
  }

  Widget _filtersActivities(BuildContext context, List<Activity> activities) {
    return FilteredData<Activity>(
      data: activities,
      filtersBloc: BlocProvider.of<SearchActivitiesFiltersBloc>(context),
      child: (context, activities) => _buildMap(context, activities),
    );
  }

  Widget _buildMap(BuildContext context, List<Activity> activities) {
    var latLng = Geohash.decode(SharedPreferences().geohash);

    return CustomClusterGoogleMap(
      initialLocation: LatLng(latLng.x, latLng.y),
      clusterItems: _getClusters(activities),
      onButtonTap: () => onRefresh(context),
      onClusterTap: (cluster) => _onClusterTap(context, cluster),
    );
  }

  List<ClusterItem<Activity>> _getClusters(List<Activity> activities) {
    return [
      for (Activity activity in activities)
        ClusterItem(activity.latLng, item: activity),
    ];
  }

  void _onClusterTap(BuildContext context, Cluster<Activity> cluster) {
    List<Activity> activities = cluster.markers.map((e) => e.item).toList();
    CustomBottomSheet.show(
      context,
      (context) => CustomScrollView(
        slivers: [
          buildActivitiesList(
            context,
            activities,
          ),
        ],
      ),
    );
  }

  Widget buildActivitiesList(BuildContext context, List<Activity> activities) {
    // todo a little repetition here
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          for (Activity activity in activities)
            buildActivityTile(context, activity)
        ],
      ),
    );
  }

  Widget buildActivityTile(BuildContext context, Activity activity) {
    return ActivityCard(activity: activity);
  }
}
