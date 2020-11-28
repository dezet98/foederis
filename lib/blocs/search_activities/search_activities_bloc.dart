import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:engineering_thesis/blocs/filter.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/repositories/activity_repository.dart';
import 'package:engineering_thesis/shared/exceptions.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'search_activities_event.dart';
part 'search_activities_state.dart';

class SearchActivitiesBloc
    extends Bloc<SearchActivitiesEvent, SearchActivitiesState> {
  ActivityRepository activityRepository;

  SearchActivitiesBloc(this.activityRepository)
      : super(SearchActivitiesInitialState()) {
    add(SearchActivitiesFetchEvent());
  }

  @override
  Stream<SearchActivitiesState> mapEventToState(
    SearchActivitiesEvent event,
  ) async* {
    if (event is SearchActivitiesFetchEvent) {
      try {
        List<Activity> activities =
            await activityRepository.getAllActivities(event.filters);
        yield SearchActivitiesFetchSuccessState(activites: activities);
      } catch (e) {
        yield SearchActivitiesFetchFailureState(message: e.toString());
      }
    }
  }
}
