import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

enum TextType {
  screen_bar_title,
  button,
  subtitle1,
  subtitle2,
}

class CustomText extends StatelessWidget {
  final TextType textType;
  final String text;
  CustomText(this.text, {@required this.textType});

  @override
  Widget build(BuildContext context) {
    switch (textType) {
      case TextType.screen_bar_title:
        return PlatformWidget(
          material: (context, platform) =>
              Text(text, style: Theme.of(context).textTheme.headline6),
          cupertino: (context, platform) => Text(text),
        );
        break;
      case TextType.button:
        return Text(text, style: Theme.of(context).textTheme.button);
        break;
      case TextType.subtitle1:
        return Text(text, style: Theme.of(context).textTheme.subtitle1);
        break;
      case TextType.subtitle2:
        return Text(text, style: Theme.of(context).textTheme.subtitle2);
        break;
    }
    assert(false);
    return Text('');
  }
}
