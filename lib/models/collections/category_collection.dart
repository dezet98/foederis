import 'query_field.dart';

class CategoryCollection {
  static String collectionName = 'category';

  static CollectionField ref =
      CollectionField(fieldName: 'ref', isRequired: false);
  static CollectionField title =
      CollectionField(fieldName: 'title', isRequired: true);

  static List<CollectionField> get allFields => [
        ref,
        title,
      ];
}
