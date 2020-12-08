import 'package:engineering_thesis/blocs/abstract_blocs/form_data/form_data/form_data_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/form_data/form_option/form_field_bloc.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/shared/builders/forms/single_check_form.dart';
import 'package:engineering_thesis/shared/builders/forms/single_date_form.dart';
import 'package:engineering_thesis/shared/builders/forms/single_number_form.dart';
import 'package:engineering_thesis/shared/builders/forms/single_text_form.dart';
import 'package:engineering_thesis/shared/components/app_bars/custom_app_bar.dart';
import 'package:engineering_thesis/shared/templates/template_screen.dart';
import 'package:flutter/widgets.dart';

class FormDataScreen extends StatelessWidget {
  final FormDataBloc formDataBloc;

  FormDataScreen({@required this.formDataBloc});

  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      platformAppBar: _buildAppBar(context),
      body: Column(
        children: [
          for (FormFieldBloc optionBloc in formDataBloc.formsData)
            _buildSingleForm(optionBloc)
        ],
      ),
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
      return SingleTextForm(singleTextFormBloc: optionBloc);
    else if (optionBloc is FormFieldBloc<bool>) {
      return SingleCheckForm(singleCheckFormBloc: optionBloc);
    } else if (optionBloc is FormFieldBloc<DateTime>) {
      return SingleDateForm(singleDataFormBloc: optionBloc);
    } else if (optionBloc is FormFieldBloc<int>) {
      return SingleNumberForm(singleNumberFormBloc: optionBloc);
    }
    assert(false, "optionBloc not provided");
    return Container();
  }
}
