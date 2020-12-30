import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class CustomTextFormField {
  static Widget normal({
    @required TextEditingController textEditingController,
    Function(String) onChamged,
    bool enabled,
    bool obscureText,
    String placeholder,
  }) {
    return PlatformTextField(
      controller: textEditingController,
      onChanged: onChamged,
      enabled: enabled,
      obscureText: obscureText,
      material: (_, __) => MaterialTextFieldData(
        decoration: InputDecoration(hintText: placeholder),
      ),
      cupertino: (_, __) => CupertinoTextFieldData(placeholder: placeholder),
    );
  }

  static Widget digits({
    @required TextEditingController textEditingController,
    Function(String) onChamged,
    bool enabled,
  }) {
    return PlatformTextField(
      controller: textEditingController,
      enabled: enabled,
      onChanged: onChamged,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }
}
