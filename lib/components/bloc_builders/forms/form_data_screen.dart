import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/abstract_blocs/forms/form_address_field_bloc.dart';
import '../../../blocs/abstract_blocs/forms/form_check_field_bloc.dart';
import '../../../blocs/abstract_blocs/forms/form_data/form_data_bloc.dart';
import '../../../blocs/abstract_blocs/forms/form_date_field_bloc.dart';
import '../../../blocs/abstract_blocs/forms/form_field/form_field_bloc.dart';
import '../../../blocs/abstract_blocs/forms/form_number_field_bloc.dart';
import '../../../blocs/abstract_blocs/forms/form_number_range_field_bloc.dart';
import '../../../blocs/abstract_blocs/forms/form_option_list_field_bloc.dart';
import '../../../blocs/abstract_blocs/forms/form_text_field_bloc.dart';
import '../../../models/category.dart';
import '../../custom_widgets/app_bars/custom_app_bar.dart';
import '../../custom_widgets/buttons/custom_button.dart';
import '../../custom_widgets/snack_bar.dart/custom_snack_bar.dart';
import '../../templates/template_screen.dart';
import 'form_address_field.dart';
import 'form_check_field.dart';
import 'form_date_field.dart';
import 'form_number_field.dart';
import 'form_number_range_field.dart';
import 'form_option_list_field.dart';
import 'form_text_field.dart';

class FormDataScreen extends StatelessWidget {
  final FormDataBloc formDataBloc;
  final String formAppBarTitle;
  final String formNextButtonText;

  FormDataScreen(
      {@required this.formDataBloc,
      @required this.formAppBarTitle,
      @required this.formNextButtonText});

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
          return CustomButton.loadingButton();
        }

        return CustomButton.flatButton(
          text: formNextButtonText,
          enabled: formDataBloc.isValid,
          onPressed: () {
            formDataBloc.add(FormDataSendingEvent());
          },
        );
      },
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      appBarType: AppBarType.close,
      title: formAppBarTitle,
    );
  }

  Widget _buildSingleForm(FormFieldBloc optionBloc) {
    if (optionBloc is FormTextFieldBloc)
      return FormTextField(
          formFieldBloc: optionBloc, formDataBloc: formDataBloc);
    else if (optionBloc is FormCheckFieldBloc) {
      return FormCheckField(
          formFieldBloc: optionBloc, formDataBloc: formDataBloc);
    } else if (optionBloc is FormDateFieldBloc) {
      return FormDateField(
          formFieldBloc: optionBloc, formDataBloc: formDataBloc);
    } else if (optionBloc is FormNumberFieldBloc) {
      return FormNumberField(
          formFieldBloc: optionBloc, formDataBloc: formDataBloc);
    } else if (optionBloc is FormOptionListFieldBloc<Category>) {
      return FormOptionListField(
          formFieldBloc: optionBloc, formDataBloc: formDataBloc);
    } else if (optionBloc is FormAddressFieldBloc) {
      return FormAddressField(
          formFieldBloc: optionBloc, formDataBloc: formDataBloc);
    } else if (optionBloc is FormNumberRangeFieldBloc) {
      return FormNumberRangeField(
          formFieldBloc: optionBloc, formDataBloc: formDataBloc);
    }
    assert(false, "{ error: optionBloc not provided }");
    return Container();
  }
}
