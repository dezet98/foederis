import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/send/send_bloc.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/repositories/activity_repository.dart';

class CreateActivitySendBloc extends SendBloc {
  final ActivityRepository _activityRepository;

  CreateActivitySendBloc(this._activityRepository);

  @override
  Future<void> query({Map<String, dynamic> queryFields}) async {
    await Future.delayed(Duration(seconds: 8));
    DocumentReference activityRef =
        await _activityRepository.createActivity(Activity.fromMap(queryFields));
    print(activityRef);
  }
}
