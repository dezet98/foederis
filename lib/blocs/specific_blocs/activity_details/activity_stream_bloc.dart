import 'package:engineering_thesis/blocs/abstract_blocs/stream/stream_bloc.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/repositories/activity_repository.dart';
import 'package:meta/meta.dart';

class ActivityStreamBloc extends StreamBloc<Activity> {
  final ActivityRepository _activityRepository;
  final Activity activity;

  ActivityStreamBloc(this._activityRepository, {@required this.activity});

  @override
  Stream<Activity> stream() {
    return _activityRepository.getCollectionItemStream(activity.ref);
  }
}
