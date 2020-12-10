import 'package:meta/meta.dart';

class QueryField<QueryType> {
  String fieldName;
  // QueryType fieldValue;
  bool isRequired;

  QueryField({
    @required this.fieldName,
    //@required this.fieldValue,
    @required this.isRequired,
  });
}
