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
