import 'package:engineering_thesis/blocs/abstract_blocs/send/send_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/validators/validators_bloc.dart';
import 'package:engineering_thesis/components/bloc_builders/send_with_validator/validators_info.dart';
import 'package:flutter/widgets.dart';

class SendWithValidator extends StatelessWidget {
  final SendBloc sendBloc;
  final ValidatorsBloc validatorsBloc;
  final Widget validSendButton;
  final Widget invalidSendButton;

  SendWithValidator({
    @required this.sendBloc,
    @required this.validatorsBloc,
    @required this.validSendButton,
    @required this.invalidSendButton,
  });

  @override
  Widget build(BuildContext context) {
    if (validatorsBloc.checkValid()) return _build(button: validSendButton);

    return _build(
        button: invalidSendButton,
        info: ValidatorsInfo(validators: validatorsBloc.validators()));
  }

  Widget _build({Widget info, @required Widget button}) {
    return Column(
      children: [
        if (info != null) info,
        button,
      ],
    );
  }
}
