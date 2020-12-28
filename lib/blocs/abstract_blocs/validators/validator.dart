abstract class Validator<ValueType> {
  bool isValid();

  static bool checkValid(List<Validator> _validators) {
    // todo to erase
    for (Validator validator in _validators)
      if (!validator.isValid()) return false;
    return true;
  }
}
