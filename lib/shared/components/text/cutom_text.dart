import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

enum TextType {
  page_title,
  body_text,
  modal_text,
  list_item,
  menu_title,
  secondary_text,
  tab,
  button,
  text_button,
  form_text,
  error_text,
}

class CustomText extends StatelessWidget {
  final TextType textType;
  final String text;
  CustomText(this.text, {@required this.textType});

  @override
  Widget build(BuildContext context) {
    switch (textType) {
      case TextType.page_title:
        return PlatformWidget(
          material: (context, platform) =>
              Text(text, style: Theme.of(context).textTheme.headline1),
          cupertino: (context, platform) => Text(text),
        );
        break;
      case TextType.button:
        return PlatformWidget(
          material: (context, platform) =>
              Text(text, style: Theme.of(context).textTheme.button),
          cupertino: (context, platform) => Text(text),
        );
        break;
      case TextType.body_text:
        return PlatformWidget(
          material: (context, platform) =>
              Text(text, style: Theme.of(context).textTheme.bodyText1),
          cupertino: (context, platform) => Text(text),
        );
        break;
      case TextType.modal_text:
        return PlatformWidget(
          material: (context, platform) =>
              Text(text, style: Theme.of(context).textTheme.bodyText2),
          cupertino: (context, platform) => Text(text),
        );
        break;
      case TextType.list_item:
        return PlatformWidget(
          material: (context, platform) =>
              Text(text, style: Theme.of(context).textTheme.bodyText2),
          cupertino: (context, platform) => Text(text),
        );
        break;
      case TextType.menu_title:
        return PlatformWidget(
          material: (context, platform) =>
              Text(text, style: Theme.of(context).textTheme.headline3),
          cupertino: (context, platform) => Text(text),
        );
        break;
      case TextType.secondary_text:
        PlatformWidget(
          material: (context, platform) =>
              Text(text, style: Theme.of(context).textTheme.bodyText1),
          cupertino: (context, platform) => Text(text),
        );
        break;
      case TextType.tab:
        PlatformWidget(
          material: (context, platform) =>
              Text(text, style: Theme.of(context).textTheme.headline3),
          cupertino: (context, platform) => Text(text),
        );
        break;
      case TextType.text_button:
        PlatformWidget(
          material: (context, platform) =>
              Text(text, style: Theme.of(context).textTheme.button),
          cupertino: (context, platform) => Text(text),
        );
        break;
      case TextType.form_text:
        PlatformWidget(
          material: (context, platform) =>
              Text(text, style: Theme.of(context).textTheme.bodyText2),
          cupertino: (context, platform) => Text(text),
        );
        break;
      case TextType.error_text:
        PlatformWidget(
          material: (context, platform) =>
              Text(text, style: Theme.of(context).textTheme.subtitle2),
          cupertino: (context, platform) => Text(text),
        );
        break;
    }
    assert(false);
    return Text('');
  }
}
