import 'package:engineering_thesis/blocs/abstract_blocs/send/send_bloc.dart';
import 'package:engineering_thesis/models/attendee.dart';
import 'package:engineering_thesis/repositories/attendee_repository.dart';
import 'package:meta/meta.dart';

class CancelAttendeeSendBloc extends SendBloc {
  final AttendeeRepository _attendeeRepository;
  final Attendee attendee;

  CancelAttendeeSendBloc(this._attendeeRepository, {@required this.attendee});

  @override
  Future<void> query(Map<String, dynamic> valuesMap) async {
    return await _attendeeRepository.cancelAttendee(attendee);
  }
}
