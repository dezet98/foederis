import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/send/send_bloc.dart';
import 'package:engineering_thesis/data/models/activity.dart';
import 'package:engineering_thesis/data/models/attendee.dart';
import 'package:engineering_thesis/data/models/collections/attendee_collection.dart';
import 'package:engineering_thesis/data/repositories/transaction_and_batch_repository.dart';
import 'package:meta/meta.dart';

class MakerRegistrationAttendeeSendBloc extends SendBloc {
  final TransactionAndBatchRepository _transactionRepository;
  final Activity activity;
  final DocumentReference userRef;
  final DocumentReference appealToJoinRef;

  MakerRegistrationAttendeeSendBloc(this._transactionRepository,
      {@required this.activity,
      @required this.userRef,
      @required this.appealToJoinRef});

  @override
  Future<void> query(_) async {
    await _transactionRepository.addAttendeeAndDeleteAppealToJoin(
      attendee: Attendee.fromMap({
        AttendeeCollection.activityRef.fieldName: activity.ref,
        AttendeeCollection.userRef.fieldName: userRef,
        AttendeeCollection.joinDate.fieldName: DateTime.now(),
        AttendeeCollection.role.fieldName: AttendeeRole.attendee,
      }),
      appealToJoinRef: appealToJoinRef,
    );
  }
}
