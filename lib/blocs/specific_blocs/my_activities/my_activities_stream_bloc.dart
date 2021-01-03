import 'package:engineering_thesis/blocs/abstract_blocs/stream/stream_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/authorization/user_data/user_data_bloc.dart';
import 'package:engineering_thesis/models/attendee.dart';
import 'package:engineering_thesis/repositories/attendee_repository.dart';

class MyActivitiesStreamBloc extends StreamBloc<List<Attendee>> {
  final AttendeeRepository _activityRepository;
  final UserDataBloc _userDataBloc;
  MyActivitiesStreamBloc(this._activityRepository, this._userDataBloc);

  @override
  Stream<List<Attendee>> stream() {
    return _activityRepository.getAttendeesStreamByUser(_userDataBloc.user.ref);
  }
}
