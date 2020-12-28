import 'package:engineering_thesis/blocs/abstract_blocs/send/send_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/validators/validators_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendWithValidator extends StatelessWidget {
  final SendBloc sendBloc;
  final ValidatorsBloc validatorsBloc;

  SendWithValidator({
    @required this.sendBloc,
    @required this.validatorsBloc,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      cubit: validatorsBloc,
      builder: (context, state) {
        if (state is ValidatorsValidState) {
          return Text('Valid');
        } else if (state is ValidatorsInvalidState) {
          return Text(state.messsage);
        }

        return Text('Check validation...');
      },
    );
  }
}
