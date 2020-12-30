import 'dart:io';

import 'package:engineering_thesis/blocs/abstract_blocs/forms/form_field/form_field_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/forms/form_photo_field_bloc.dart';
import 'package:engineering_thesis/components/custom_widgets/avatar/custom_user_avatar.dart';
import 'package:engineering_thesis/components/custom_widgets/buttons/custom_button.dart';
import 'package:engineering_thesis/components/custom_widgets/icon/custom_icon.dart';
import 'package:engineering_thesis/components/custom_widgets/text/cutom_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/abstract_blocs/forms/form_data/form_data_bloc.dart';

class FormPhotoField extends StatelessWidget {
  final FormPhotoFieldBloc formFieldBloc;
  final FormDataBloc formDataBloc;

  FormPhotoField({@required this.formFieldBloc, @required this.formDataBloc});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      cubit: formFieldBloc,
      listener: (context, state) {
        if (state is FormFieldClearedState) {}
      },
      builder: (context, state) {
        return Column(
          children: [
            CustomText(
              formFieldBloc.getLabel(context),
              textType: formFieldBloc.isValid
                  ? TextType.valid_form_title
                  : TextType.invalid_form_title,
              alignment: Alignment.centerLeft,
            ),
            _buildPhoto(context),
            CustomButton.flatButton(
                text: formFieldBloc.result == null
                    ? 'Choose file'
                    : formFieldBloc.result.path,
                onPressed: () async {
                  FilePickerResult pickedFile = await FilePicker.platform
                      .pickFiles(type: FileType.image, allowCompression: true);

                  if (pickedFile != null) {
                    File file = File(pickedFile.files.first.path);

                    formDataBloc.add(FormDataEditingEvent(
                      formFieldBloc: formFieldBloc,
                      result: file,
                    ));
                  }
                })
          ],
        );
      },
    );
  }

  Widget _buildPhoto(context) {
    if (formFieldBloc.result != null) {
      return _buildPhotoWithCropPosibility(formFieldBloc.result);
    } else if (formFieldBloc.result == null &&
        formFieldBloc.initialPhotoUrl != null)
      return CustomUserAvatar.fromUrl(formFieldBloc.initialPhotoUrl);

    return CustomUserAvatar.fromIcon(CustomIcon.userAvatar(context));
  }

  Widget _buildPhotoWithCropPosibility(File file) {
    return Stack(
      children: [
        CustomUserAvatar.fromFile(file),
        CustomButton.iconButton(),
      ],
    );
  }
}
