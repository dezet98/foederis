abstract class Validator<ValueType> {
  bool isValid();
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
}

class NotNullValidator extends Validator {
  final dynamic value;

  NotNullValidator(this.value);

  @override
  bool isValid() {
    return value != null;
  }
}
