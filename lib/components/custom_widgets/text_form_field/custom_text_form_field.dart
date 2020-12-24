import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

enum TextFormType { normal, digits }

class CustomTextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final Function(String) onChamged;
  final TextFormType textFormType;
  final bool enabled;

  CustomTextFormField({
    @required this.textEditingController,
    this.onChamged,
    this.textFormType = TextFormType.normal,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    switch (textFormType) {
      case TextFormType.normal:
        return _buildNormalTextFormField(context);
      case TextFormType.digits:
        return _buildDigitsTextFormField(context);
    }
    assert(false, "TextFormType not provider");
    return Container();
  }

  Widget _buildNormalTextFormField(BuildContext context) {
    return PlatformTextField(
      controller: textEditingController,
      onChanged: onChamged,
      enabled: enabled,
    );
  }

  Widget _buildDigitsTextFormField(BuildContext context) {
    return PlatformTextField(
      controller: textEditingController,
      enabled: enabled,
      onChanged: onChamged,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }
}
