import 'package:engineering_thesis/models/collections/query_field.dart';

class ActivityCollection {
  static String collectionName = 'activity';

  static QueryField ref = QueryField(fieldName: 'ref', isRequired: false);
  static QueryField title = QueryField(fieldName: 'title', isRequired: true);
  static QueryField categoryRef =
      QueryField(fieldName: 'categoryRef', isRequired: true);
  static QueryField startDate =
      QueryField(fieldName: 'startDate', isRequired: true);
  static QueryField endDate =
      QueryField(fieldName: 'endDate', isRequired: true);
  static QueryField maxEntry =
      QueryField(fieldName: 'maxEntry', isRequired: true);
  static QueryField minEntry =
      QueryField(fieldName: 'minEntry', isRequired: true);
  static QueryField freeJoin =
      QueryField(fieldName: 'freeJoin', isRequired: true);
  static QueryField regular =
      QueryField(fieldName: 'regular', isRequired: true);
  static QueryField geolocationRef =
      QueryField(fieldName: 'geolocationRef', isRequired: true);

  static List<QueryField> get allFields => [
        ref,
        title,
        categoryRef,
        startDate,
        endDate,
        maxEntry,
        minEntry,
        freeJoin,
        regular,
        geolocationRef,
      ];
}
