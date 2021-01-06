import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/send/send_bloc.dart';
import 'package:engineering_thesis/data/models/activity.dart';
import 'package:engineering_thesis/data/models/attendee.dart';
import 'package:engineering_thesis/data/models/collections/attendee_collection.dart';
import 'package:engineering_thesis/data/repositories/attendee_repository.dart';
import 'package:meta/meta.dart';

class FreeJoinRegistrationAttendeeSendBloc extends SendBloc {
  final AttendeeRepository _attendeeRepository;
  final Activity activity;
  final DocumentReference userRef;

  FreeJoinRegistrationAttendeeSendBloc(
    this._attendeeRepository, {
    @required this.activity,
    @required this.userRef,
  });

  @override
  Future<void> query(_) async {
    await _attendeeRepository.createAttendee(
      Attendee.fromMap({
        AttendeeCollection.activityRef.fieldName: activity.ref,
        AttendeeCollection.userRef.fieldName: userRef,
        AttendeeCollection.joinDate.fieldName: DateTime.now(),
        AttendeeCollection.role.fieldName: AttendeeRole.attendee,
      }),
    );
  }
}
