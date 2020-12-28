import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/validators/validator.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/validators/validators_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/authorization/user_data/user_data_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/validators/validators.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/models/attendee.dart';
import 'package:engineering_thesis/models/collections/attendee_collection.dart';
import 'package:engineering_thesis/repositories/attendee_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

class ActivityDetailsRegisterSendValidators extends ValidatorsBloc {
  final AttendeeRepository _attendeeRepository;
  final UserDataBloc _userDataBloc;
  final Activity activity;

  ActivityDetailsRegisterSendValidators(
      this._attendeeRepository, this._userDataBloc,
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

    return [
      attedneeValidator(attendees, _userDataBloc.user.ref),
      maxEntryValidator(attendees, activity),
    ];
  }

  Validator attedneeValidator(
          List<Attendee> attendees, DocumentReference userRef) =>
      CustomValidator(
        isValidFunction: (_) =>
            attendees.where((el) => el.userRef.id == userRef.id).length == 0,
        argValue: null,
        validatorFailureInfo: (BuildContext context) =>
            'Jesteś już uczestnikiem aktywności.',
        validatorLabel: (BuildContext context) => '',
      );

  Validator maxEntryValidator(List<Attendee> attendees, Activity activity) =>
      CustomValidator(
        isValidFunction: (_) => attendees.length < activity.maxEntry,
        argValue: null,
        validatorFailureInfo: (BuildContext context) =>
            'Niestety nie ma już miejsc na daną aktywność',
        validatorLabel: (BuildContext context) => '',
      );
}
