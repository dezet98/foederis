import 'package:meta/meta.dart';

class CollectionField {
  String fieldName;
  bool isRequired;
  dynamic defaultValue;

  CollectionField({
    @required this.fieldName,
    @required this.isRequired,
    this.defaultValue,
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
