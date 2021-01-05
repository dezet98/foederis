import '../utils/query_field.dart';

class AppealToJoinCollection {
  static String collectionName = 'appeal_to_join';

  static CollectionField activityRef =
      CollectionField(fieldName: 'activityRef', isRequired: true);
  static CollectionField userRef =
      CollectionField(fieldName: 'userRef', isRequired: true);
  static CollectionField submissionDate =
      CollectionField(fieldName: 'submissionDate', isRequired: true);
  static CollectionField comment =
      CollectionField(fieldName: 'comment', isRequired: false);

  static List<CollectionField> get allFields =>
      [activityRef, userRef, submissionDate, comment];
}
