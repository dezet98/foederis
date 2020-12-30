import 'package:engineering_thesis/components/custom_widgets/popup_menu/custom_popup_menu_item.dart';
import 'package:flutter/material.dart';

class CustomPopupMenu extends StatelessWidget {
  final List<CustomPopupMenuItem> popupMenuItems;
  final Widget customButton;

  CustomPopupMenu({@required this.popupMenuItems, @required this.customButton});
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (_) {
        return popupMenuItems as List<PopupMenuItem>;
      },
      child: customButton,
    );
  }
}
