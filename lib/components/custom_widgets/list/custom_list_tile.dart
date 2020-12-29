import 'package:engineering_thesis/components/custom_widgets/text/cutom_text.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Widget> actionButtons;

  CustomListTile({this.title, this.subtitle, this.actionButtons});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: CustomText(
              title ?? '',
              textType: TextType.menu_title,
            ),
            subtitle: CustomText(
              subtitle ?? '',
              textType: TextType.list_item,
            ),
          ),
          if (actionButtons != null)
            Row(
              children: actionButtons,
            )
        ],
      ),
    );
  }
}
