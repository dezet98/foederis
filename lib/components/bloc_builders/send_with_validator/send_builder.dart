import 'package:engineering_thesis/blocs/abstract_blocs/send/send_bloc.dart';
import 'package:engineering_thesis/components/custom_widgets/buttons/custom_button.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendBuilder extends StatelessWidget {
  final SendBloc sendBloc;
  final String sendButtonText;
  final Function afterSuccess;

  SendBuilder({
    @required this.sendBloc,
    @required this.sendButtonText,
    this.afterSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      cubit: sendBloc,
      listener: (context, state) {
        if (state is SendDataSuccessState) {
          if (afterSuccess != null) afterSuccess();
        }
      },
      builder: (context, state) {
        if (state is SendDataInProgressState) {
          return CustomButton.loadingButton();
        }

        return CustomButton.flatButton(
          text: sendButtonText,
          onPressed: () => sendBloc.add(SendDataEvent()),
        );
      },
    );
  }
}
