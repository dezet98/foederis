import 'package:engineering_thesis/blocs/abstract_blocs/send/send_bloc.dart';
import 'package:engineering_thesis/components/bloc_builders/forms/form_screen/normal_form.dart';
import 'package:engineering_thesis/components/bloc_builders/forms/form_screen/stepper_form.dart';
import 'package:engineering_thesis/components/custom_widgets/icon/custom_icon.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/shared/routing/routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/abstract_blocs/forms/form_data/form_data_bloc.dart';
import '../../../custom_widgets/app_bars/custom_app_bar.dart';
import '../../../custom_widgets/buttons/custom_button.dart';
import '../../../custom_widgets/snack_bar.dart/custom_snack_bar.dart';
import '../../../templates/template_screen.dart';

class FormDataWithSendScreen extends StatelessWidget {
  final FormDataBloc formDataBloc;
  final String formAppBarTitle;
  final String formNextButtonText;
  final SendBloc sendBloc;
  final Function afterSuccess;
  final Function afterError;
  final bool useStepper;

  FormDataWithSendScreen({
    @required this.formDataBloc,
    @required this.formNextButtonText,
    @required this.sendBloc,
    this.useStepper = false,
    this.formAppBarTitle,
    this.afterSuccess,
    this.afterError,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      cubit: sendBloc,
      listener: _sendBlocListener,
      child: formAppBarTitle == null
          ? _buildForm(context)
          : TemplateScreen(
              platformAppBar: _buildAppBar(context),
              body: _buildForm(context),
              usePadding: false,
            ),
    );
  }

  Widget _buildForm(context) {
    return BlocBuilder(
      cubit: formDataBloc,
      builder: (context, state) {
        if (useStepper)
          return StepperForm(
            formDataBloc: formDataBloc,
            buildApplyButton: _buildApplyButton,
          );
        return NormalForm(
          formDataBloc: formDataBloc,
          buildApplyButton: _buildApplyButton,
        );
      },
    );
  }

  Widget _buildApplyButton(BuildContext context) {
    return BlocBuilder(
      cubit: sendBloc,
      builder: (context, state) {
        if (state is SendDataInProgressState) {
          return CustomButton.loadingButton();
        }

        return BlocBuilder(
          cubit: formDataBloc,
          builder: (context, state) {
            return CustomButton.goToOtherScreen(
              text: formNextButtonText,
              enabled: formDataBloc.isValid,
              onPressed: () {
                sendBloc.add(
                  SendDataEvent(valuesMap: formDataBloc.queryFields()),
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      customIcon: CustomIcon.closeScreen,
      title: formAppBarTitle,
      trailingActions: [
        CustomButton.goToOtherScreen(
            text: S.of(context).form_clear_button_text,
            onPressed: () {
              formDataBloc.add(FormDataClearEvent());
            })
      ],
    );
  }

  void _sendBlocListener(BuildContext context, dynamic state) {
    if (state is SendDataFailureState) {
      _sendError(context);
    } else if (state is SendDataSuccessState) {
      _sendSuccess(context);
    } else if (state is SendDataInProgressState) {
      _sendInProgress(context);
    }
  }

  void _sendSuccess(BuildContext context) {
    formDataBloc.add(FormDataClearEvent());
    formDataBloc.add(FormDataEditingEnabledEvent());
    if (afterSuccess == null) {
      Routing.pop(context);
      CustomSnackBar.showInfoSnackBar(context,
          message: S.of(context).snackbar_form_send_error_success);
    } else
      afterSuccess();
  }

  void _sendError(BuildContext context) {
    formDataBloc.add(FormDataEditingEnabledEvent());

    if (afterError == null) {
      CustomSnackBar.showErrorSnackBar(context,
          message: S.of(context).snackbar_form_send_error);
    } else
      afterError();
  }

  void _sendInProgress(BuildContext context) {
    formDataBloc.add(FormDataEditingDisableEvent());
  }
}
