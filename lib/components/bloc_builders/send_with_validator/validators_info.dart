import 'package:engineering_thesis/blocs/abstract_blocs/validators/validator.dart';
import 'package:flutter/widgets.dart';

class ValidatorsInfo extends StatelessWidget {
  final List<Validator> validators;

  ValidatorsInfo({@required this.validators});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (Validator validator in validators)
          _buildValidInfo(context, validator)
      ],
    );
  }

  Widget _buildValidInfo(context, Validator validator) {
    return Column(children: [
      if (!validator.isValid()) Text(validator.validatorFailureInfo(context)),
    ]);
  }
}
