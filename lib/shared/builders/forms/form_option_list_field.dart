import 'package:engineering_thesis/blocs/abstract_blocs/form_data/form_data/form_data_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/form_data/form_option_list_field_bloc.dart';
import 'package:engineering_thesis/shared/builders/fetching_builder.dart';
import 'package:engineering_thesis/shared/components/dropdown/custom_dropdown_button.dart';
import 'package:engineering_thesis/shared/components/text/cutom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormOptionListField extends StatelessWidget {
  final FormOptionListFieldBloc formFieldBloc;
  final FormDataBloc formDataBloc;

  FormOptionListField(
      {@required this.formFieldBloc, @required this.formDataBloc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder(
          cubit: formFieldBloc,
          builder: (context, state) {
            return Column(
              children: [
                CustomText(
                  formFieldBloc.getLabel(context),
                  textType: TextType.valid_form_title,
                  alignment: Alignment.centerLeft,
                ),
                FetchingBuilder(
                    fetchingCubit: formFieldBloc.listOptionFetchingBloc,
                    buildSuccess: (data) {
                      return CustomDropdownButton(
                        value: formFieldBloc.result,
                        dropdownItems: data,
                        getItemLabel: formFieldBloc.getLabelFromOption,
                        onChanged: (result) {
                          if (formDataBloc.editingEnabled)
                            formDataBloc.add(FormDataEditingEvent(
                              formFieldBloc: formFieldBloc,
                              result: result,
                            ));
                        },
                      );
                    }),
              ],
            );
          },
        ),
      ],
    );
  }
}
