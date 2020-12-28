import 'query_field.dart';

class AttendeeCollection {
  static String collectionName = 'attendee';

  static CollectionField activityRef =
      CollectionField(fieldName: 'activityRef', isRequired: true);
  static CollectionField userRef =
      CollectionField(fieldName: 'userRef', isRequired: true);
  static CollectionField joinDate =
      CollectionField(fieldName: 'joinDate', isRequired: true);

  static List<CollectionField> get allFields =>
      [activityRef, userRef, joinDate];
}
