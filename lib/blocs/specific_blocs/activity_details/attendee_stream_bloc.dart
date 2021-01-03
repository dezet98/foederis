import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/stream/stream_bloc.dart';
import 'package:engineering_thesis/models/attendee.dart';
import 'package:engineering_thesis/repositories/attendee_repository.dart';
import 'package:meta/meta.dart';

class AttendeeStreamBloc extends StreamBloc<List<Attendee>> {
  final AttendeeRepository _attendeeRepository;
  final DocumentReference activityRef;

  AttendeeStreamBloc(this._attendeeRepository, {@required this.activityRef});

  @override
  Stream<List<Attendee>> stream() {
    return _attendeeRepository.getAttendeesStreamByActivity(activityRef);
  }
}
