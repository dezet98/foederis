import 'package:engineering_thesis/blocs/abstract_blocs/validators/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

class CustomValidator<ArgType> extends Validator {
  ArgType argValue;
  bool Function(ArgType) isValidFunction;

  CustomValidator(
      {@required this.isValidFunction,
      @required this.argValue,
      this.validatorFailureInfo,
      this.validatorLabel});

  @override
  bool isValid() {
    return isValidFunction(argValue);
  }

  @override
  String Function(BuildContext) validatorFailureInfo;

  @override
  String Function(BuildContext) validatorLabel;
}

class DigitsValidator extends Validator {
  final String value;

  DigitsValidator(this.value);

  @override
  bool isValid() {
    try {
      int.parse(value);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  String Function(BuildContext) validatorFailureInfo;

  @override
  String Function(BuildContext) validatorLabel;
}

class LenghtValidator extends Validator<String> {
  final int min;
  final int max;
  final String value;

  LenghtValidator(this.value, {this.min, this.max});

  @override
  bool isValid() {
    int lenght = value.length;
    if (min <= lenght && lenght <= max) {
      return true;
    }

    return false;
  }

  @override
  String Function(BuildContext) validatorFailureInfo;

  @override
  String Function(BuildContext) validatorLabel;
}

class DateTimeRangeValidator extends Validator<DateTime> {
  final DateTime minDate;
  final DateTime maxDate;
  final DateTime value;

  DateTimeRangeValidator(this.value, {this.minDate, this.maxDate});

  @override
  bool isValid() {
    return value.isBefore(maxDate) && value.isAfter(minDate);
  }

  @override
  String Function(BuildContext) validatorFailureInfo;

  @override
  String Function(BuildContext) validatorLabel;
}

class NumberRangeValidator extends Validator {
  final int min;
  final int max;
  final int value;

  NumberRangeValidator(this.value, {this.min, this.max});

  @override
  bool isValid() {
    return (min == null ? value : min) <= value &&
        value >= (max == null ? value : max);
  }

  @override
  String Function(BuildContext) validatorFailureInfo;

  @override
  String Function(BuildContext) validatorLabel;
}

enum NumberCompareType {
  isEqualTo,
  isNotEqualTo,
  isLessThan,
  isLessThanOrEqualTo,
  isGreaterThan,
  isGreaterThanOrEqualTo,
}

class NumbersValidator extends Validator {
  final int value1;
  final int value2;
  final NumberCompareType compareType;

  NumbersValidator(this.value1, this.value2, this.compareType);

  @override
  bool isValid() {
    switch (compareType) {
      case NumberCompareType.isEqualTo:
        return value1 == value2;
        break;
      case NumberCompareType.isNotEqualTo:
        return value1 != value2;
        break;
      case NumberCompareType.isLessThan:
        return value1 < value2;
        break;
      case NumberCompareType.isLessThanOrEqualTo:
        return value1 <= value2;
        break;
      case NumberCompareType.isGreaterThan:
        return value1 > value2;
        break;
      case NumberCompareType.isGreaterThanOrEqualTo:
        return value1 >= value2;
        break;
    }
    return false;
  }

  @override
  String Function(BuildContext) validatorFailureInfo;

  @override
  String Function(BuildContext) validatorLabel;
}

class NotNullValidator extends Validator {
  final dynamic value;

  NotNullValidator(this.value);

  @override
  bool isValid() {
    return value != null;
  }

  @override
  String Function(BuildContext) validatorFailureInfo;

  @override
  String Function(BuildContext) validatorLabel;
}
