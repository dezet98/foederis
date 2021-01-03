import 'package:engineering_thesis/blocs/abstract_blocs/send/send_bloc.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/repositories/activity_repository.dart';
import 'package:meta/meta.dart';

class CancelActivitySendBloc extends SendBloc {
  final ActivityRepository _activityRepository;
  final Activity activity;

  CancelActivitySendBloc(this._activityRepository, {@required this.activity});

  @override
  Future<void> query(Map<String, dynamic> valuesMap) async {
    return await _activityRepository.cancelActivity(activity);
  }
}
