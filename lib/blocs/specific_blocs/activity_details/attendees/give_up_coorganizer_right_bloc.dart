import 'package:engineering_thesis/blocs/abstract_blocs/send/send_bloc.dart';
import 'package:engineering_thesis/data/models/attendee.dart';
import 'package:engineering_thesis/data/repositories/attendee_repository.dart';
import 'package:meta/meta.dart';

class GiveUpCoorganizerRightsSendBloc extends SendBloc {
  final AttendeeRepository _attendeeRepository;
  final Attendee attendee;

  GiveUpCoorganizerRightsSendBloc(this._attendeeRepository,
      {@required this.attendee});

  @override
  Future<void> query(_) async {
    return await _attendeeRepository.giveUpCoorganizatorRights(attendee);
  }
}
