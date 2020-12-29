import 'package:engineering_thesis/blocs/abstract_blocs/validators/validator.dart';

abstract class Validators {
  List<Validator> validators();

  bool checkValid() {
    for (Validator validator in validators())
      if (!validator.isValid()) return false;
    return true;
  }
}
