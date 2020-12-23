import 'package:engineering_thesis/constants/enums.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/models/collections/activity_collection.dart';
import 'package:engineering_thesis/models/fetch_filter.dart';
import 'package:engineering_thesis/repositories/activity_repository.dart';
import 'package:engineering_thesis/shared/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:geohash/geohash.dart';
import 'package:google_maps_webservice/geocoding.dart';
import '../abstract_blocs/fetch/fetch_bloc.dart';

class SearchActivitiesFetchingBloc extends FetchBloc<List<Activity>> {
  ActivityRepository activityRepository;

  SearchActivitiesFetchingBloc({@required this.activityRepository});

  @override
  Future<List<Activity>> fetch(List<FetchFilter> filters) async {
    return await activityRepository
        .fetchAllActivities(filters ?? getFetchFilters());
  }

  static List<FetchFilter> getFetchFilters(
      {Location location, int distanceKm}) {
    Location loc = location ??
        Location(
          Geohash.decode(SharedPreferences().geohash).x,
          Geohash.decode(SharedPreferences().geohash).y,
        );
    int disKm = distanceKm ?? int.parse(SharedPreferences().distanceKm);

    var lowerLat = loc.lat - 0.0144927536231884 * disKm;
    var lowerLon = loc.lng - 0.0181818181818182 * disKm;
    var upperLat = loc.lat + 0.0144927536231884 * disKm;
    var upperLon = loc.lng + 0.0181818181818182 * disKm;

    return [
      FetchFilter(
        fieldName: ActivityCollection.geohash.fieldName,
        fieldValue: Geohash.encode(lowerLat, lowerLon),
        filterType: FetchFilterType.isGreaterThanOrEqualTo,
      ),
      FetchFilter(
        fieldName: ActivityCollection.geohash.fieldName,
        fieldValue: Geohash.encode(upperLat, upperLon),
        filterType: FetchFilterType.isLessThanOrEqualTo,
      ),
    ];
  }

  @override
  List get initialFilters => getFetchFilters();
}
