import 'package:engineering_thesis/components/custom_widgets/gesture_detector/custom_gesture_detector.dart';
import 'package:engineering_thesis/components/custom_widgets/text/cutom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class CustomButton {
  static Widget applyForm(
      {String text, bool enabled = true, final void Function() onPressed}) {
    return _raisedButton(enabled: enabled, onPressed: onPressed, text: text);
  }

  static Widget goToOtherScreen(
      {String text, bool enabled = true, final void Function() onPressed}) {
    return _flatButton(enabled: enabled, onPressed: onPressed, text: text);
  }

  static Widget _raisedButton(
      {String text, bool enabled = true, final void Function() onPressed}) {
    return PlatformButton(
      child: CustomText(text,
          textType:
              !enabled ? TextType.unavailable_text_button : TextType.button),
      onPressed: enabled ? onPressed : null,
      material: (context, platform) => MaterialRaisedButtonData(),
      cupertino: (context, platform) => CupertinoButtonData(),
    );
  }

  static Widget _flatButton(
      {String text, bool enabled = true, final void Function() onPressed}) {
    return PlatformButton(
      child: CustomText(text,
          textType:
              !enabled ? TextType.unavailable_text_button : TextType.button),
      onPressed: enabled ? onPressed : null,
      materialFlat: (context, platform) => MaterialFlatButtonData(),
      cupertinoFilled: (context, platform) => CupertinoFilledButtonData(),
    );
  }

  static Widget loadingButton(
      {bool enabled = true, final void Function() onPressed}) {
    return PlatformButton(
      child: PlatformCircularProgressIndicator(),
      onPressed: enabled ? onPressed : null,
      materialFlat: (context, platform) => MaterialFlatButtonData(),
      cupertinoFilled: (context, platform) => CupertinoFilledButtonData(),
    );
  }

  static Widget iconButton({
    bool enabled = true,
    @required Widget customIcon,
    final void Function() onPressed,
  }) {
    return PlatformIconButton(
      onPressed: enabled ? onPressed : null,
      icon: customIcon,
    );
  }

  static Widget floatingButton(
      {bool enabled = true,
      Widget customIcon,
      final void Function() onPressed}) {
    return FloatingActionButton(
      heroTag: null,
      child: customIcon,
      onPressed: enabled ? onPressed : null,
      mini: true,
    );
  }

  static Widget iconWithTextButton({
    @required String text,
    bool enabled = true,
    Widget customIcon,
    final void Function() onPressed,
  }) {
    return CustomGestureDetector(
      onTap: enabled ? onPressed : null,
      child: Row(
        children: [
          customIcon,
          CustomText(text, textType: TextType.button),
        ],
      ),
    );
  }
}
