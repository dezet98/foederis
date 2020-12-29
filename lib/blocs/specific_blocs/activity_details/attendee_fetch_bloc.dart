import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/fetch/fetch_bloc.dart';
import 'package:engineering_thesis/repositories/attendee_repository.dart';
import 'package:meta/meta.dart';

class AttendeeFetchBloc extends FetchBloc {
  final AttendeeRepository _attendeeRepository;
  final DocumentReference activityRef;

  AttendeeFetchBloc(this._attendeeRepository, {@required this.activityRef});

  @override
  Future fetch(_) async {
    await _attendeeRepository.fetchAllAttendees(activityRef);
  }
}