import 'package:engineering_thesis/components/custom_widgets/buttons/custom_button.dart';
import 'package:engineering_thesis/components/custom_widgets/icon/custom_icon.dart';
import 'package:flutter/material.dart';

class CustomPopupMenu extends StatelessWidget {
  final List<PopupMenuItem> popupMenuItems;
  final Widget customButton;

  CustomPopupMenu({@required this.popupMenuItems, this.customButton});
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (_) {
        return popupMenuItems;
      },
      child: customButton ??
          CustomButton.iconButton(customIcon: CustomIcon.more(context)),
    );
  }
}
