import 'package:engineering_thesis/blocs/abstract_blocs/send/send_bloc.dart';
import 'package:engineering_thesis/models/attendee.dart';
import 'package:engineering_thesis/repositories/attendee_repository.dart';
import 'package:meta/meta.dart';

class GrantCoorganizerRightsSendBloc extends SendBloc {
  final AttendeeRepository _attendeeRepository;
  final Attendee attendee;

  GrantCoorganizerRightsSendBloc(this._attendeeRepository,
      {@required this.attendee});

  @override
  Future<void> query(_) async {
    return await _attendeeRepository.grantCoorganizatorRights(attendee);
  }
}
