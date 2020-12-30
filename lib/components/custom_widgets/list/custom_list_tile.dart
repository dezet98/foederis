import 'package:engineering_thesis/components/custom_widgets/gesture_detector/custom_gesture_detector.dart';
import 'package:engineering_thesis/components/custom_widgets/text/cutom_text.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget leading;
  final List<Widget> actionButtons;
  final Function onTap;

  CustomListTile(
      {this.title,
      this.subtitle,
      this.actionButtons,
      this.onTap,
      this.leading});

  @override
  Widget build(BuildContext context) {
    return CustomGestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: CustomText.menuTitle(
                title ?? '',
              ),
              subtitle: CustomText.listItem(
                subtitle ?? '',
              ),
              leading: leading,
            ),
            if (actionButtons != null && actionButtons.length > 0)
              Row(
                children: actionButtons,
              )
          ],
        ),
      ),
    );
  }
}
