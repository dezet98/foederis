import 'package:engineering_thesis/shared/components/text/cutom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

enum ButtonType {
  raised_next_button,
  flat_next_button,
  icon_button,
  floating_button,
  loading_button,
}

class CustomButton extends StatelessWidget {
  final ButtonType buttonType;
  final void Function() onPressed;
  final String text;
  final IconData materialIconData;
  final IconData cupertinoIconData;
  final bool enabled;

  CustomButton({
    @required this.buttonType,
    this.onPressed,
    this.text = '',
    this.materialIconData,
    this.cupertinoIconData,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    switch (buttonType) {
      case ButtonType.raised_next_button:
        return _buildRaisedNextButton();
        break;
      case ButtonType.flat_next_button:
        return _builFlatNextButton();
        break;

      case ButtonType.icon_button:
        return _builIconButton();
        break;
      case ButtonType.floating_button:
        return _buildFloatingButton();
        break;
      case ButtonType.loading_button:
        return _builLoadingButton();
        break;
    }
    assert(false);
    return Text('unavailable');
  }

  Widget _buildRaisedNextButton() {
    return PlatformButton(
      child: CustomText(text,
          textType:
              !enabled ? TextType.unavailable_text_button : TextType.button),
      onPressed: enabled ? onPressed : null,
      material: (context, platform) => MaterialRaisedButtonData(),
      cupertino: (context, platform) => CupertinoButtonData(),
    );
  }

  Widget _builFlatNextButton() {
    return PlatformButton(
      child: CustomText(text,
          textType:
              !enabled ? TextType.unavailable_text_button : TextType.button),
      onPressed: enabled ? onPressed : null,
      materialFlat: (context, platform) => MaterialFlatButtonData(),
      cupertinoFilled: (context, platform) => CupertinoFilledButtonData(),
    );
  }

  Widget _builLoadingButton() {
    return PlatformButton(
      child: PlatformCircularProgressIndicator(),
      onPressed: enabled ? onPressed : null,
      materialFlat: (context, platform) => MaterialFlatButtonData(),
      cupertinoFilled: (context, platform) => CupertinoFilledButtonData(),
    );
  }

  Widget _builIconButton() {
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
      onPressed: onPressed,
      materialIcon: Icon(materialIconData),
      cupertinoIcon: Icon(cupertinoIconData),
      material: (_, __) => MaterialIconButtonData(),
      cupertino: (_, __) => CupertinoIconButtonData(),
    );
  }

  Widget _buildFloatingButton() {
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
}
