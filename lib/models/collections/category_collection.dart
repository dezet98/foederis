import 'package:engineering_thesis/models/collections/query_field.dart';

class CategoryCollection {
  static String collectionName = 'category';

  static QueryField ref = QueryField(fieldName: 'ref', isRequired: false);
  static QueryField title = QueryField(fieldName: 'title', isRequired: true);

  static List<QueryField> get allFields => [
        ref,
        title,
      ];
}
