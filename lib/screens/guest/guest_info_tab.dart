import 'package:engineering_thesis/components/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/components/custom_widgets/icon/custom_icon.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/screens/guest/guest_prohibited_info.dart';
import 'package:flutter/material.dart';

class GuestInfoTab extends NavBarTab {
  @override
  Widget build(BuildContext context) {
    return GuestProhibitedInfo.getProhibitedInfo(
        context, S.of(context).guest_prohibited_access_info_tab_content);
  }

  @override
  Widget getIcon(BuildContext context) => CustomIcon.guestInfoBottomTab;

  @override
  String getLabel(BuildContext context) =>
      S.of(context).guest_prohibited_info_bottom_tab_label;
}
