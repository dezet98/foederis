import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/stream/stream_bloc.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/models/attendee.dart';
import 'package:engineering_thesis/repositories/activity_repository.dart';
import 'package:meta/meta.dart';

/// activity stream, if attendee is provided it will be added to activity
class ActivityStreamBloc extends StreamBloc<Activity> {
  final ActivityRepository _activityRepository;
  final DocumentReference activityRef;
  final Attendee attendee;

  ActivityStreamBloc(
    this._activityRepository, {
    @required this.activityRef,
    this.attendee,
  });

  @override
  Stream<Activity> stream() {
    return _activityRepository
        .getCollectionItemStream(activityRef)
        .map((activity) {
      if (attendee == null || attendee.activityRef.id != activity.ref.id)
        return activity;

      activity.attendee = attendee;
      return activity;
    });
  }
}
