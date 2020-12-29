import 'package:engineering_thesis/components/custom_widgets/text/cutom_text.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;

  CustomListTile({this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: CustomText(
          title ?? '',
          textType: TextType.menu_title,
        ),
        subtitle: CustomText(
          subtitle ?? '',
          textType: TextType.list_item,
        ),
      ),
    );
  }
}
