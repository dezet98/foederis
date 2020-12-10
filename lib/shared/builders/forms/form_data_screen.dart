import 'package:engineering_thesis/blocs/abstract_blocs/form_data/form_data/form_data_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/form_data/form_option/form_field_bloc.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/shared/builders/forms/single_check_form.dart';
import 'package:engineering_thesis/shared/builders/forms/single_date_form.dart';
import 'package:engineering_thesis/shared/builders/forms/single_number_form.dart';
import 'package:engineering_thesis/shared/builders/forms/single_text_form.dart';
import 'package:engineering_thesis/shared/components/app_bars/custom_app_bar.dart';
import 'package:engineering_thesis/shared/components/buttons/custom_button.dart';
import 'package:engineering_thesis/shared/components/snack_bar.dart/custom_snack_bar.dart';
import 'package:engineering_thesis/shared/templates/template_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormDataScreen extends StatelessWidget {
  final FormDataBloc formDataBloc;

  FormDataScreen({@required this.formDataBloc});

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      cubit: formDataBloc,
      listener: formDataBlocListener,
      child: TemplateScreen(
        platformAppBar: _buildAppBar(context),
        body: Form(
          child: Column(
            children: [
              for (FormFieldBloc optionBloc in formDataBloc.formsData)
                _buildSingleForm(optionBloc),
              _buildApplyButton(context),
            ],
          ),
        ),
      ),
    );
  }

  void formDataBlocListener(BuildContext context, dynamic state) {
    if (state is FormDataUploadFailureState) {
      CustomSnackBar.show(
          context, SnackBarType.error, state.uploadDataException.toString());
    } else if (state is FormDataUploadSuccessState) {
      CustomSnackBar.show(context, SnackBarType.error, 'Success');
    }
  }

  Widget _buildApplyButton(BuildContext context) {
    return BlocBuilder(
      cubit: formDataBloc,
      builder: (context, state) {
        if (state is FormDataUploadInProgressState) {
          return CustomButton(buttonType: ButtonType.loading_button);
        }

        return CustomButton(
          buttonType: ButtonType.flat_next_button,
          text: 'create',
          onPressed: !formDataBloc.isValid
              ? null
              : () {
                  formDataBloc.add(FormDataSendingEvent());
                },
        );
      },
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      appBarType: AppBarType.close,
      title: S.of(context).create_activity_screen_nav_title,
    );
  }

  Widget _buildSingleForm(FormFieldBloc optionBloc) {
    if (optionBloc is FormFieldBloc<String>)
      return SingleTextForm(
          formFieldBloc: optionBloc, formDataBloc: formDataBloc);
    else if (optionBloc is FormFieldBloc<bool>) {
      return SingleCheckForm(
          formFieldBloc: optionBloc, formDataBloc: formDataBloc);
    } else if (optionBloc is FormFieldBloc<DateTime>) {
      return SingleDateForm(
          formFieldBloc: optionBloc, formDataBloc: formDataBloc);
    } else if (optionBloc is FormFieldBloc<int>) {
      return SingleNumberForm(
          formFieldBloc: optionBloc, formDataBloc: formDataBloc);
    }
    assert(false, "optionBloc not provided");
    return Container();
  }
}
