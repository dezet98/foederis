import 'package:engineering_thesis/repositories/category_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:geohash/geohash.dart';
import 'package:google_maps_webservice/geocoding.dart';

import '../../../models/activity.dart';
import '../../../models/collections/activity_collection.dart';
import '../../../models/fetch_filter.dart';
import '../../../repositories/activity_repository.dart';
import '../../../shared/constants/enums.dart';
import '../../../shared/shared_preferences.dart';
import '../../abstract_blocs/fetch/fetch_bloc.dart';

class SearchActivitiesFetchingBloc extends FetchBloc<List<Activity>> {
  ActivityRepository activityRepository;
  CategoryRepository categoryRepository;
  SearchActivitiesFetchingBloc(
      {@required this.activityRepository, @required this.categoryRepository});

  @override
  Future<List<Activity>> fetch(List<FetchFilter> filters) async {
    List<Activity> activities = await activityRepository
        .fetchAllActivities(filters ?? getFetchFilters());

    for (Activity activity in activities)
      activity.category =
          await categoryRepository.fetchCategory(activity.categoryRef);

    return activities;
  }

  static List<FetchFilter> getFetchFilters(
      {Location location, int distanceKm}) {
    Location loc = location ??
        Location(
          Geohash.decode(SharedPreferences().geohash).x,
          Geohash.decode(SharedPreferences().geohash).y,
        );
    int disKm = distanceKm ?? int.parse(SharedPreferences().distanceKm);

    // (1 / 111) is value of one degree of langtiude in conversion to km
    // (1 / 111.3) is value of one degree of longitude in conversion to km
    var lowerLat = loc.lat - (1 / 111) * disKm;
    var lowerLon = loc.lng - (1 / 111.3) * disKm;
    var upperLat = loc.lat + (1 / 111) * disKm;
    var upperLon = loc.lng + (1 / 111.3) * disKm;

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
