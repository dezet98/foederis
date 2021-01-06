import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/fetch/fetch_bloc.dart';
import 'package:engineering_thesis/data/models/attendee.dart';
import 'package:engineering_thesis/data/repositories/attendee_repository.dart';
import 'package:meta/meta.dart';

class AttendeeFetchBloc extends FetchBloc {
  final AttendeeRepository _attendeeRepository;
  final DocumentReference activityRef;

  AttendeeFetchBloc(this._attendeeRepository, {@required this.activityRef});

  @override
  Future<List<Attendee>> fetch(_) async {
    return await _attendeeRepository.fetchAllAttendees(activityRef);
  }
}
