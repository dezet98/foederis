import 'package:meta/meta.dart';

class CollectionField {
  String fieldName;
  bool isRequired;

  CollectionField({
    @required this.fieldName,
    @required this.isRequired,
  });
}

class QueryField<QueryType> {
  String fieldName;
  QueryType fieldValue;

  QueryField({
    @required this.fieldName,
    @required this.fieldValue,
  });
}
