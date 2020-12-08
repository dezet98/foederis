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
  valid_form_title,
  invalid_form_title,
}

class CustomText extends StatelessWidget {
  final TextType textType;
  final String text;
  final AlignmentGeometry alignment;
  final Color color;

  CustomText(
    this.text, {
    @required this.textType,
    this.alignment,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    if (alignment != null)
      return Align(child: _buildText(), alignment: alignment);
    return _buildText();
  }

  Widget _buildText() {
    switch (textType) {
      case TextType.page_title:
        return pageTitle(text);
      case TextType.button:
        return button(text);
      case TextType.body_text:
        return bodyText(text);
      case TextType.modal_text:
        return modalText(text);
      case TextType.list_item:
        return listItem(text);
      case TextType.menu_title:
        return menuTitle(text);
      case TextType.secondary_text:
        return secondaryText(text);
      case TextType.tab:
        return tab(text);
      case TextType.text_button:
        return textButton(text);
      case TextType.form_text:
        return formText(text);
      case TextType.error_text:
        return errorText(text);
      case TextType.valid_form_title:
        return validFormTitle(text);
        break;
      case TextType.invalid_form_title:
        return invalidFormTitle(text);
        break;
    }
    assert(false);
    return Text('');
  }
}

Widget menuTitle(text) => PlatformWidget(
      material: (context, platform) =>
          Text(text, style: Theme.of(context).textTheme.headline3),
      cupertino: (context, platform) => Text(text),
    );

Widget errorText(text) => PlatformWidget(
      material: (context, platform) =>
          Text(text, style: Theme.of(context).textTheme.subtitle2),
      cupertino: (context, platform) => Text(text),
    );

Widget formText(text) => PlatformWidget(
      material: (context, platform) =>
          Text(text, style: Theme.of(context).textTheme.bodyText2),
      cupertino: (context, platform) => Text(text),
    );

Widget textButton(text) => PlatformWidget(
      material: (context, platform) =>
          Text(text, style: Theme.of(context).textTheme.button),
      cupertino: (context, platform) => Text(text),
    );

Widget tab(text) => PlatformWidget(
      material: (context, platform) =>
          Text(text, style: Theme.of(context).textTheme.headline3),
      cupertino: (context, platform) => Text(text),
    );

Widget secondaryText(text) => PlatformWidget(
      material: (context, platform) =>
          Text(text, style: Theme.of(context).textTheme.bodyText1),
      cupertino: (context, platform) => Text(text),
    );

Widget listItem(text) => PlatformWidget(
      material: (context, platform) =>
          Text(text, style: Theme.of(context).textTheme.bodyText2),
      cupertino: (context, platform) => Text(text),
    );

Widget modalText(text) => PlatformWidget(
      material: (context, platform) =>
          Text(text, style: Theme.of(context).textTheme.bodyText2),
      cupertino: (context, platform) => Text(text),
    );

Widget bodyText(text) => PlatformWidget(
      material: (context, platform) =>
          Text(text, style: Theme.of(context).textTheme.bodyText1),
      cupertino: (context, platform) => Text(text),
    );

Widget button(text) => PlatformWidget(
      material: (context, platform) =>
          Text(text, style: Theme.of(context).textTheme.button),
      cupertino: (context, platform) => Text(text),
    );

Widget pageTitle(text) => PlatformWidget(
      material: (context, platform) =>
          Text(text, style: Theme.of(context).textTheme.headline1),
      cupertino: (context, platform) => Text(text),
    );

Widget validFormTitle(text) => PlatformWidget(
      material: (context, platform) => Text(text,
          style: Theme.of(context)
              .textTheme
              .headline3
              .copyWith(color: Colors.green)),
      cupertino: (context, platform) => Text(text),
    );

Widget invalidFormTitle(text) => PlatformWidget(
      material: (context, platform) => Text(text,
          style: Theme.of(context)
              .textTheme
              .headline3
              .copyWith(color: Colors.red)),
      cupertino: (context, platform) => Text(text),
    );
