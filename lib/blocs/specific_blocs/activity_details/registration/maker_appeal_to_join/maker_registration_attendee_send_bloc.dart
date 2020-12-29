import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/send/send_bloc.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/models/attendee.dart';
import 'package:engineering_thesis/models/collections/attendee_collection.dart';
import 'package:engineering_thesis/repositories/appeal_to_join_repository.dart';
import 'package:engineering_thesis/repositories/attendee_repository.dart';
import 'package:meta/meta.dart';

class MakerRegistrationAttendeeSendBloc extends SendBloc {
  final AttendeeRepository _attendeeRepository;
  final AppealToJoinRepository _appealToJoinRepository;
  final Activity activity;
  final DocumentReference userRef;
  final DocumentReference appealToJoinRef;

  MakerRegistrationAttendeeSendBloc(
      this._attendeeRepository, this._appealToJoinRepository,
      {@required this.activity,
      @required this.userRef,
      @required this.appealToJoinRef});

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

    await _appealToJoinRepository.deleteAppealToJoin(appealToJoinRef);
  }
}
