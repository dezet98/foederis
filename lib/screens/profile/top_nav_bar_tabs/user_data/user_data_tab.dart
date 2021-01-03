import 'package:engineering_thesis/components/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/components/templates/user_data.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/models/app_user.dart';
import 'package:flutter/material.dart';

class UserDataTab extends NavBarTab {
  final AppUser appUser;
  final bool withContactInfo;
  UserDataTab({@required this.appUser, this.withContactInfo = false});

  @override
  Widget build(BuildContext context) {
    return UserData(
      appUser: appUser,
      withContactInfo: withContactInfo,
    );
  }

  @override
  Widget getIcon(BuildContext context) => null;

  @override
  String getLabel(BuildContext context) =>
      S.of(context).user_profile_screen_basic_info_tab;
}
