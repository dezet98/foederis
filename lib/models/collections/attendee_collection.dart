import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/shared/utils/enums.dart';
import 'package:flutter/material.dart';

import '../utils/query_field.dart';

class AttendeeCollection {
  static String collectionName = 'attendee';

  static CollectionField activityRef =
      CollectionField(fieldName: 'activityRef', isRequired: true);
  static CollectionField userRef =
      CollectionField(fieldName: 'userRef', isRequired: true);
  static CollectionField joinDate =
      CollectionField(fieldName: 'joinDate', isRequired: true);
  static CollectionField isCancel =
      CollectionField(fieldName: 'isCancel', isRequired: false);
  static CollectionField role = CollectionField(
      fieldName: 'role',
      isRequired: true,
      defaultValue: enumToString(AttendeeRole.attendee));

  static List<CollectionField> get allFields =>
      [activityRef, userRef, joinDate, isCancel];

  static attendeeToString(BuildContext context, AttendeeRole role) {
    switch (role) {
      case AttendeeRole.attendee:
        return S.of(context).activity_role_attendee;
        break;
      case AttendeeRole.coorganizer:
        return S.of(context).activity_role_coorganizator;
        break;
      case AttendeeRole.maker:
        return S.of(context).activity_role_maker;
        break;
    }
  }
}

enum AttendeeRole { attendee, coorganizer, maker }
