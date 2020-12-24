import 'package:engineering_thesis/shared/constants/enums.dart';
import 'package:flutter/cupertino.dart';

class FetchFilter<FieldValueType> {
  String fieldName;
  FieldValueType fieldValue;
  FetchFilterType filterType;

  FetchFilter(
      {@required this.fieldName,
      @required this.fieldValue,
      @required this.filterType});
}
