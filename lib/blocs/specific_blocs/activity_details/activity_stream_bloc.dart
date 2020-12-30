import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/stream/stream_bloc.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/repositories/activity_repository.dart';
import 'package:meta/meta.dart';

class ActivityStreamBloc extends StreamBloc<Activity> {
  final ActivityRepository _activityRepository;
  final DocumentReference activityRef;

  ActivityStreamBloc(this._activityRepository, {@required this.activityRef});

  @override
  Stream<Activity> stream() {
    return _activityRepository.getCollectionItemStream(activityRef);
  }
}
