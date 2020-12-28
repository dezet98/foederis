import 'package:engineering_thesis/blocs/abstract_blocs/validators/validator.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/validators/validators_bloc.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/models/attendee.dart';
import 'package:engineering_thesis/models/collections/attendee_collection.dart';
import 'package:engineering_thesis/repositories/attendee_repository.dart';
import 'package:meta/meta.dart';

class ActivityDetailsRegisterSendValidators extends ValidatorsBloc {
  final AttendeeRepository _attendeeRepository;
  final Activity activity;

  ActivityDetailsRegisterSendValidators(this._attendeeRepository,
      {@required this.activity});

  @override
  Future<List<Validator>> initValidator() async {
    List<Attendee> attendees =
        await _attendeeRepository.fetchAllAttendees(activity.ref);

    // add organizator to attendee list:
    attendees.add(Attendee.fromMap({
      AttendeeCollection.activityRef.fieldName: activity.ref,
      AttendeeCollection.joinDate.fieldName: activity.startDate,
      AttendeeCollection.userRef.fieldName: activity.userRef,
    }));

    return [];
  }
}
