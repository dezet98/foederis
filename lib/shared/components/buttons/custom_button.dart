import 'package:engineering_thesis/shared/components/gesture_detector.dart';
import 'package:engineering_thesis/shared/components/text/cutom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class CustomButton {
  static Widget raisedButton(
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

  static Widget flatButton(
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

  static Widget iconButton(
      {bool enabled = true,
      IconData materialIconData,
      IconData cupertinoIconData,
      final void Function() onPressed}) {
    // return PlatformWidget(
    //   material: (_, __) => IconButton(
    //     icon: Icon(materialIconData),
    //     onPressed: onPressed != null ? onPressed : () {},
    //   ),
    //   cupertino: (_, __) => CupertinoButton(
    //     child: Icon(Icons.ac_unit),
    //     onPressed: onPressed != null ? onPressed : () {},
    //   ),
    // );
    return PlatformIconButton(
      onPressed: enabled ? onPressed : null,
      materialIcon: Icon(materialIconData),
      cupertinoIcon: Icon(cupertinoIconData),
      material: (_, __) => MaterialIconButtonData(),
      cupertino: (_, __) => CupertinoIconButtonData(),
    );
  }

  static Widget floatingButton(
      {bool enabled = true,
      IconData materialIconData,
      IconData cupertinoIconData,
      final void Function() onPressed}) {
    return PlatformWidget(
      material: (_, __) => FloatingActionButton(
        heroTag: null,
        child: Icon(materialIconData),
        onPressed: enabled ? onPressed : null,
        mini: true,
      ),
      cupertino: (_, __) => FloatingActionButton(
        heroTag: null,
        child: Icon(cupertinoIconData),
        onPressed: enabled ? onPressed : null,
        mini: true,
      ),
    );
  }

  static Widget iconWithTextButton({
    @required String text,
    bool enabled = true,
    IconData materialIconData,
    IconData cupertinoIconData,
    final void Function() onPressed,
  }) {
    return CustomGestureDetector(
      onTap: enabled ? onPressed : null,
      child: PlatformWidget(
        material: (_, __) => Row(
          children: [
            Icon(Icons.ac_unit_outlined),
            CustomText(text, textType: TextType.button),
          ],
        ),
        cupertino: (_, __) => Row(
          children: [
            Icon(Icons.ac_unit_outlined),
            CustomText(text, textType: TextType.button),
          ],
        ),
      ),
    );
  }
}
