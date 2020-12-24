import 'query_field.dart';

class ActivityCollection {
  static String collectionName = 'activity';

  static CollectionField title =
      CollectionField(fieldName: 'title', isRequired: true);
  static CollectionField categoryRef =
      CollectionField(fieldName: 'categoryRef', isRequired: true);
  static CollectionField startDate =
      CollectionField(fieldName: 'startDate', isRequired: true);
  static CollectionField maxEntry =
      CollectionField(fieldName: 'maxEntry', isRequired: true);
  static CollectionField minEntry =
      CollectionField(fieldName: 'minEntry', isRequired: true);
  static CollectionField freeJoin =
      CollectionField(fieldName: 'freeJoin', isRequired: true);
  static CollectionField regular =
      CollectionField(fieldName: 'regular', isRequired: true);
  static CollectionField geohash =
      CollectionField(fieldName: 'geohash', isRequired: true);
  static CollectionField address =
      CollectionField(fieldName: 'address', isRequired: true);

  static List<CollectionField> get allFields => [
        title,
        categoryRef,
        startDate,
        maxEntry,
        minEntry,
        freeJoin,
        regular,
        geohash,
        address,
      ];
}
