import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/fetch/fetch_bloc.dart';
import 'package:engineering_thesis/data/models/attendee.dart';
import 'package:engineering_thesis/data/repositories/attendee_repository.dart';
import 'package:meta/meta.dart';

class UserAttendeeFetchBloc extends FetchBloc {
  final AttendeeRepository _attendeeRepository;
  final DocumentReference activityRef;
  final DocumentReference userRef;

  UserAttendeeFetchBloc(this._attendeeRepository,
      {@required this.activityRef, @required this.userRef});

  @override
  Future<Attendee> fetch(_) async {
    return await _attendeeRepository.fetchAttendee(activityRef, userRef);
  }
}
