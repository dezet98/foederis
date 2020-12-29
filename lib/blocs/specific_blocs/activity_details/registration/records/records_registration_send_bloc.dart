import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/send/send_bloc.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/repositories/attendee_repository.dart';
import 'package:meta/meta.dart';

class RecordsRegistrationSendBloc extends SendBloc {
  final AttendeeRepository _attendeeRepository;
  final Activity activity;
  final DocumentReference userRef;

  RecordsRegistrationSendBloc(this._attendeeRepository,
      {@required this.activity, @required this.userRef});

  @override
  Future<void> query(_) async {}
}
