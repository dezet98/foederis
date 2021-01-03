import 'package:engineering_thesis/blocs/abstract_blocs/validators/validator.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

class CustomValidator<ArgType> extends Validator {
  ArgType argValue;
  bool Function(ArgType) isValidFunction;

  CustomValidator(
      {@required this.isValidFunction,
      @required this.argValue,
      @required this.validatorInfo});

  @override
  bool isValid() {
    return isValidFunction(argValue);
  }

  @override
  String Function(BuildContext) validatorInfo;
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
  String Function(BuildContext) get validatorInfo =>
      (context) => S.of(context).form_field_info_digits_validator;
}

class PhoneValidator extends Validator {
  final String value;
  final bool zeroIsValid;
  PhoneValidator(this.value, {this.zeroIsValid = false});

  @override
  bool isValid() {
    try {
      if (zeroIsValid && value.length == 0) return true;
      var number = value.replaceAll(new RegExp(r"\s+"), "");
      if (number.length != 9) return false;
      int.parse(number);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  String Function(BuildContext) get validatorInfo =>
      (context) => S.of(context).form_field_info_phone_validator;
}

class LenghtValidator extends Validator<String> {
  final int min;
  final int max;
  final String value;
  final bool zeroIsValid;

  LenghtValidator(this.value, {this.min, this.max, this.zeroIsValid = false});

  @override
  bool isValid() {
    if (value == null) return false;

    int lenght = value.length;
    if (zeroIsValid && lenght == 0) return true;
    if (min <= lenght && lenght <= max) {
      return true;
    }

    return false;
  }

  @override
  String Function(BuildContext) get validatorInfo => (context) =>
      S.of(context).form_field_info_lenght_validator(min ?? '', max ?? '');
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
  String Function(BuildContext) get validatorInfo =>
      (context) => S.of(context).form_field_info_date_time_range_validator(
          minDate.toString() ?? '', maxDate.toString() ?? '');
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

  String toSign(NumberCompareType compareType) {
    switch (compareType) {
      case NumberCompareType.isEqualTo:
        return '=';
        break;
      case NumberCompareType.isNotEqualTo:
        return '!=';
        break;
      case NumberCompareType.isLessThan:
        return '<';
        break;
      case NumberCompareType.isLessThanOrEqualTo:
        return '<=';
        break;
      case NumberCompareType.isGreaterThan:
        return '>';
        break;
      case NumberCompareType.isGreaterThanOrEqualTo:
        return '>=';
        break;
    }
    return '?';
  }

  @override
  String Function(BuildContext) get validatorInfo => (context) =>
      S.of(context).form_field_info_numbers_validator(toSign(compareType));
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
  String Function(BuildContext) get validatorInfo => (context) =>
      S.of(context).form_field_info_numbers_range_validator(min, max);
}

class NotNullValidator extends Validator {
  final dynamic value;

  NotNullValidator(this.value);

  @override
  bool isValid() {
    return value != null;
  }

  @override
  String Function(BuildContext) get validatorInfo =>
      (context) => S.of(context).form_field_info_not_null_validator;
}
