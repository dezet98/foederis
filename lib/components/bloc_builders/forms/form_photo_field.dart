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
import 'package:image_cropper/image_cropper.dart';

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
                  FilePickerResult pickedFile =
                      await FilePicker.platform.pickFiles(type: FileType.image);

                  if (pickedFile != null) {
                    _updateResult(File(pickedFile.files.single.path));
                  }
                })
          ],
        );
      },
    );
  }

  void _updateResult(File file) {
    formDataBloc.add(FormDataEditingEvent(
      formFieldBloc: formFieldBloc,
      result: file,
    ));
  }

  Widget _buildPhoto(context) {
    if (formFieldBloc.result != null) {
      return _buildPhotoWithCropPosibility(context, formFieldBloc.result);
    } else if (formFieldBloc.result == null &&
        formFieldBloc.initialPhotoUrl != null)
      return CustomUserAvatar.fromUrl(context, formFieldBloc.initialPhotoUrl);

    return CustomUserAvatar.fromIcon(CustomIcon.userAvatar(context));
  }

  Widget _buildPhotoWithCropPosibility(context, File file) {
    return Stack(
      children: [
        CustomUserAvatar.fromFile(context, file),
        Positioned(
          right: 0,
          child: CustomButton.floatingButton(
              customIcon: CustomIcon.cropFile(context),
              onPressed: () async {
                File croppedFile = await ImageCropper.cropImage(
                    sourcePath: file.path,
                    aspectRatioPresets: [
                      CropAspectRatioPreset.square,
                      CropAspectRatioPreset.ratio3x2,
                      CropAspectRatioPreset.original,
                      CropAspectRatioPreset.ratio4x3,
                      CropAspectRatioPreset.ratio16x9
                    ],
                    androidUiSettings: AndroidUiSettings(
                        toolbarTitle: 'Cropper',
                        toolbarColor: Colors.deepOrange,
                        toolbarWidgetColor: Colors.white,
                        initAspectRatio: CropAspectRatioPreset.original,
                        lockAspectRatio: false),
                    iosUiSettings: IOSUiSettings(
                      minimumAspectRatio: 1.0,
                    ));

                if (croppedFile != null) _updateResult(croppedFile);
              }),
        ),
      ],
    );
  }
}
