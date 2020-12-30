import 'package:engineering_thesis/blocs/abstract_blocs/send/send_bloc.dart';
import 'package:engineering_thesis/components/custom_widgets/buttons/custom_button.dart';
import 'package:engineering_thesis/components/custom_widgets/snack_bar.dart/custom_snack_bar.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendBuilderButton extends StatelessWidget {
  final SendBloc sendBloc;
  final String sendButtonText;
  final Function afterSuccess;
  final Function afterError;

  SendBuilderButton({
    @required this.sendBloc,
    @required this.sendButtonText,
    this.afterSuccess,
    this.afterError,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      cubit: sendBloc,
      listener: (context, state) {
        if (state is SendDataSuccessState) {
          if (afterSuccess != null) {
            afterSuccess();
          } else {
            CustomSnackBar.show(context, SnackBarType.info, 'Success');
          }
        } else if (state is SendDataFailureState) {
          if (afterError != null) {
            afterError();
          } else {
            CustomSnackBar.show(context, SnackBarType.error, state.message);
          }
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
