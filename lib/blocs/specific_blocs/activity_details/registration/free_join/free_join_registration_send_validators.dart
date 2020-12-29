import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/validators/validator.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/validators/validators_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/authorization/user_data/user_data_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/validators/validators.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/models/attendee.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

class FreeJoinRegistrationSendValidators extends ValidatorsBloc {
  final UserDataBloc _userDataBloc;
  final List<Attendee> attendees;
  final Activity activity;

  FreeJoinRegistrationSendValidators(this._userDataBloc,
      {@required this.attendees, @required this.activity});

  @override
  List<Validator> validators() {
    return [
      attedneeValidator(attendees, _userDataBloc.user.ref),
      maxEntryValidator(attendees, activity),
      dateValidator(activity),
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

  Validator dateValidator(Activity activity) => CustomValidator(
        isValidFunction: (_) => activity.startDate.isAfter(DateTime.now()),
        argValue: null,
        validatorFailureInfo: (BuildContext context) =>
            'Ta aktywność już się odbyła',
        validatorLabel: (BuildContext context) => '',
      );
}
