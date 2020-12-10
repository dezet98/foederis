import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/models/fetch_filter.dart';
import 'package:engineering_thesis/repositories/activity_repository.dart';
import 'package:flutter/cupertino.dart';
import '../abstract_blocs/fetch/fetch_bloc.dart';

class SearchActivitiesFetchingBloc extends FetchBloc<List<Activity>> {
  ActivityRepository activityRepository;

  SearchActivitiesFetchingBloc({@required this.activityRepository});

  @override
  Future<List<Activity>> fetch(List<FetchFilter> filters) async {
    return await activityRepository.fetchAllActivities(filters);
  }

  @override
  List get initialFilters => null;
}
