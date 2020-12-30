import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/send/send_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/authorization/user_data/user_data_bloc.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/models/attendee.dart';
import 'package:engineering_thesis/models/collections/attendee_collection.dart';
import 'package:engineering_thesis/repositories/activity_repository.dart';
import 'package:engineering_thesis/repositories/attendee_repository.dart';

class CreateActivitySendBloc extends SendBloc {
  final ActivityRepository _activityRepository;
  final AttendeeRepository _attendeeRepository;

  final UserDataBloc _userDataBloc;

  CreateActivitySendBloc(
      this._activityRepository, this._attendeeRepository, this._userDataBloc);

  @override
  Future<void> query(Map<String, dynamic> valuesMap) async {
    // TODO maybe use translaction
    await Future.delayed(Duration(seconds: 8));
    DocumentReference activityRef = await _activityRepository.createActivity(
        Activity.fromMap(valuesMap), _userDataBloc);

    await _attendeeRepository.createAttendee(
      Attendee.fromMap(
        {
          AttendeeCollection.activityRef.fieldName: activityRef,
          AttendeeCollection.userRef.fieldName: _userDataBloc.user.ref,
          AttendeeCollection.joinDate.fieldName: DateTime.now(),
          AttendeeCollection.role.fieldName: AttendeeRole.maker,
        },
      ),
    );
  }
}
