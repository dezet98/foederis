import 'package:engineering_thesis/blocs/abstract_blocs/fetch/fetch_args.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/fetch/fetch_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/authorization/user_data/user_data_bloc.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/repositories/activity_repository.dart';
import 'package:engineering_thesis/repositories/category_repository.dart';
import 'package:engineering_thesis/shared/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:geohash/geohash.dart';
import 'package:google_maps_webservice/geocoding.dart';

class SearchActivitiesFetchingArgsBloc extends FetchArgs {
  final int distanceKm;
  final Location location;

  SearchActivitiesFetchingArgsBloc({this.distanceKm, this.location});

  @override
  List<Object> get props => [distanceKm, location];
}

class SearchActivitiesFetchingBloc
    extends FetchBloc<List<Activity>, SearchActivitiesFetchingArgsBloc> {
  final ActivityRepository activityRepository;
  final CategoryRepository categoryRepository;
  final UserDataBloc userDataBloc;

  SearchActivitiesFetchingBloc(
      {@required this.activityRepository,
      @required this.categoryRepository,
      @required this.userDataBloc});

  @override
  Future<List<Activity>> fetch(
      SearchActivitiesFetchingArgsBloc searchActivitiesFetchingArgsBloc) async {
    Map<String, String> geohashResults =
        _getGeohash(searchActivitiesFetchingArgsBloc);

    List<Activity> activities =
        await activityRepository.fetchAllFutureActivities(
      lowerGeohash: geohashResults['lowerGeohash'],
      upperGeohash: geohashResults['upperGeohash'],
    );

    for (Activity activity in activities)
      activity.category =
          await categoryRepository.fetchCategory(activity.categoryRef);

    return activities;
  }

  Map<String, String> _getGeohash(
      SearchActivitiesFetchingArgsBloc fetchingArgsBloc) {
    Location loc = fetchingArgsBloc?.location ??
        Location(
          Geohash.decode(SharedPreferences().geohash).x,
          Geohash.decode(SharedPreferences().geohash).y,
        );
    int disKm = fetchingArgsBloc?.distanceKm ??
        int.parse(SharedPreferences().distanceKm);

    // (1 / 111) is value of one degree of langtiude in conversion to km
    // (1 / 111.3) is value of one degree of longitude in conversion to km
    var lowerLat = loc.lat - (1 / 111) * disKm;
    var lowerLon = loc.lng - (1 / 111.3) * disKm;
    var upperLat = loc.lat + (1 / 111) * disKm;
    var upperLon = loc.lng + (1 / 111.3) * disKm;

    return {
      'lowerGeohash': Geohash.encode(lowerLat, lowerLon),
      'upperGeohash': Geohash.encode(upperLat, upperLon)
    };
  }
}
