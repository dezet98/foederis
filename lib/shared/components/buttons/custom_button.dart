import 'package:engineering_thesis/shared/components/text/cutom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

enum ButtonType { raised_next_button, flat_next_button, icon_button }

class CustomButton extends StatelessWidget {
  final ButtonType buttonType;
  final void Function() onPressed;
  final String text;
  final IconData materialIconData;
  final IconData cupertinoIconData;

  CustomButton(
      {@required this.buttonType,
      this.onPressed,
      this.text = '',
      this.materialIconData,
      this.cupertinoIconData});

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
    }
    assert(false);
    return Text('unavailable');
  }

  Widget _buildRaisedNextButton() {
    return PlatformButton(
      child: CustomText(text, textType: TextType.button),
      onPressed: onPressed != null ? onPressed : () {},
      material: (context, platform) => MaterialRaisedButtonData(),
      cupertino: (context, platform) => CupertinoButtonData(),
    );
  }

  Widget _builFlatNextButton() {
    return PlatformButton(
      child: CustomText(text, textType: TextType.button),
      onPressed: onPressed != null ? onPressed : () {},
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
      onPressed: onPressed != null ? onPressed : () {},
      materialIcon: Icon(materialIconData),
      cupertinoIcon: Icon(cupertinoIconData),
      material: (_, __) => MaterialIconButtonData(),
      cupertino: (_, __) => CupertinoIconButtonData(),
    );
  }
}
