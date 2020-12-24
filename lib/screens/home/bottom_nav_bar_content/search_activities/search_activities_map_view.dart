import 'package:engineering_thesis/blocs/search_activities/search_activities_fetching_bloc.dart';
import 'package:engineering_thesis/blocs/search_activities/search_activities_filters_bloc.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/screens/home/bottom_nav_bar_content/search_activities/search_activity_app_bar.dart';
import 'package:engineering_thesis/shared/builders/fetching_bloc_builder.dart';
import 'package:engineering_thesis/shared/builders/filters/filtered_data.dart';
import 'package:engineering_thesis/shared/components/bottom_sheet/custom_bottom_sheet.dart';
import 'package:engineering_thesis/shared/components/card/custom_card.dart';
import 'package:engineering_thesis/shared/components/maps/custom_google_map.dart';
import 'package:engineering_thesis/shared/routing.dart';
import 'package:engineering_thesis/shared/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geohash/geohash.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchActivityMapView extends StatelessWidget {
  final Function(BuildContext) onRefresh;

  SearchActivityMapView({@required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SearchActivitiesAppBar.getAppBar(context),
        body: _fetchActivities(context));
  }

  Widget _fetchActivities(BuildContext context) {
    var latLng = Geohash.decode(SharedPreferences().geohash);
    return FetchingBlocBuilder(
      fetchingCubit: BlocProvider.of<SearchActivitiesFetchingBloc>(context),
      buildSuccess: (activities) {
        return FilteredData<Activity>(
          data: activities,
          filtersBloc: BlocProvider.of<SearchActivitiesFiltersBloc>(context),
          child: (context, activities) => CustomGoogleMap(
            initialLocation: LatLng(latLng.x, latLng.y),
            clusterItems: getClusters(activities),
            onButtonTap: () => onRefresh(context),
            onClusterTap: (Cluster<Activity> cluster) {
              List<Activity> activities =
                  cluster.markers.map((e) => e.item).toList();
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
            },
          ),
        );
      },
      buildError: (error) => Text('error'),
      buildInProgress: CircularProgressIndicator(),
    );
  }

  List<ClusterItem<Activity>> getClusters(List<Activity> activities) {
    return [
      for (Activity activity in activities)
        ClusterItem(activity.latLng, item: activity),
    ];
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
    return CustomCard(
      title: activity.title,
      subtitle: activity.categoryRef.toString(),
      onTap: () {
        Routing.pushNamed(context, UserRoutes.activityDetails,
            options: activity);
      },
    );
  }
}
