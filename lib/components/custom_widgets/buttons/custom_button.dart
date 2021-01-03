import 'package:engineering_thesis/components/custom_widgets/gesture_detector/custom_gesture_detector.dart';
import 'package:engineering_thesis/components/custom_widgets/text/cutom_text.dart';
import 'package:engineering_thesis/shared/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class CustomButton {
  static Widget applyForm(
      {@required String text,
      bool enabled = true,
      final void Function() onPressed}) {
    return PlatformWidget(
      material: (_, __) =>
          _raisedButton(enabled: enabled, onPressed: onPressed, text: text),
      cupertino: (_, __) =>
          _raisedButton(enabled: enabled, onPressed: onPressed, text: text),
    );
  }

  static Widget dialog(
      {@required String text,
      bool enabled = true,
      final void Function() onPressed}) {
    return _raisedButton(enabled: enabled, onPressed: onPressed, text: text);
  }

  static Widget goToOtherScreen(
      {@required String text,
      bool enabled = true,
      final void Function() onPressed}) {
    return PlatformWidget(
      material: (_, __) =>
          _flatButton(enabled: enabled, onPressed: onPressed, text: text),
      cupertino: (_, __) =>
          _raisedButton(enabled: enabled, onPressed: onPressed, text: text),
    );
  }

  static Widget _raisedButton(
      {@required String text,
      bool enabled = true,
      final void Function() onPressed}) {
    return PlatformButton(
      child: Builder(
        builder: (context) => !enabled
            ? CustomText.unavailableTextButton(text)
            : CustomText.button(text),
      ),
      onPressed: enabled ? onPressed : null,
      material: (context, platform) => MaterialRaisedButtonData(),
      cupertino: (context, platform) => CupertinoButtonData(),
    );
  }

  static Widget _flatButton(
      {@required String text,
      bool enabled = true,
      final void Function() onPressed}) {
    return PlatformButton(
      child: Builder(
        builder: (context) => !enabled
            ? CustomText.unavailableTextButton(text)
            : CustomText.button(text),
      ),
      onPressed: enabled ? onPressed : null,
      materialFlat: (context, platform) => MaterialFlatButtonData(),
      cupertinoFilled: (context, platform) => CupertinoFilledButtonData(
        padding: EdgeInsets.all(Dimensions.gutterVerySmall),
      ),
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
      material: (_, __) =>
          MaterialIconButtonData(splashRadius: Dimensions.gutterLarge),
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
          Builder(
            builder: (context) => CustomText.button(text),
          ),
        ],
      ),
    );
  }
}
