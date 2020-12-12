abstract class Validator<ValueType> {
  bool isValid(ValueType value);
}

class DigitsValidator extends Validator {
  @override
  bool isValid(value) {
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

  LenghtValidator({this.min, this.max});

  @override
  bool isValid(String value) {
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

  DateTimeRangeValidator({this.minDate, this.maxDate});

  @override
  bool isValid(DateTime value) {
    return value.isBefore(maxDate) && value.isAfter(minDate);
  }
}

class NumberRangeValidator extends Validator {
  final int min;
  final int max;
  NumberRangeValidator({this.min, this.max});

  @override
  bool isValid(value) {
    return (min == null ? value : min) <= value &&
        value >= (max == null ? value : max);
  }
}

class NotNullValidator extends Validator {
  final dynamic value;

  NotNullValidator({this.value});

  @override
  bool isValid(value) {
    return value != null;
  }
}
