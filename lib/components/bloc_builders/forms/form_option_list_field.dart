import 'package:engineering_thesis/components/bloc_builders/fetching_bloc_builder.dart';
import 'package:engineering_thesis/components/custom_widgets/dropdown/custom_dropdown_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/abstract_blocs/forms/form_data/form_data_bloc.dart';
import '../../../blocs/abstract_blocs/forms/form_option_list_field_bloc.dart';

class FormOptionListField extends StatelessWidget {
  final FormOptionListFieldBloc formFieldBloc;
  final FormDataBloc formDataBloc;

  FormOptionListField(
      {@required this.formFieldBloc, @required this.formDataBloc});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      cubit: formFieldBloc,
      builder: (context, state) {
        return Column(
          children: [
            formFieldBloc.listOption == null
                ? FetchingBlocBuilder(
                    fetchingCubit: formFieldBloc.listOptionFetchingBloc,
                    buildSuccess: (data) {
                      return _getDropdown(data);
                    })
                : _getDropdown(formFieldBloc.listOption),
          ],
        );
      },
    );
  }

  Widget _getDropdown(data) {
    return CustomDropdownButton(
      value: formFieldBloc.result,
      dropdownItems: data,
      getItemLabel: formFieldBloc.getLabelFromOption,
      enabled: formFieldBloc.editingEnabled,
      onChanged: (result) {
        if (formFieldBloc.editingEnabled)
          formDataBloc.add(FormDataEditingEvent(
            formFieldBloc: formFieldBloc,
            result: result,
          ));
      },
    );
  }
}
