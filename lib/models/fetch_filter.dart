import 'package:engineering_thesis/constants/enums.dart';
import 'package:flutter/cupertino.dart';

class FetchFilter<FieldValueType> {
  String fieldName;
  FieldValueType fieldValue;
  FilterType filterType;

  FetchFilter(
      {@required this.fieldName,
      @required this.fieldValue,
      @required this.filterType});
}
