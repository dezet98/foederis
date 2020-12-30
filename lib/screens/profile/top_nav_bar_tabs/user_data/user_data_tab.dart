import 'package:engineering_thesis/components/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/components/templates/user_data.dart';
import 'package:engineering_thesis/models/app_user.dart';
import 'package:flutter/material.dart';

class UserDataTab extends NavBarTab {
  final AppUser appUser;

  UserDataTab({@required this.appUser});

  @override
  Widget build(BuildContext context) {
    return UserData(
      appUser: appUser,
    );
  }

  @override
  Icon getIcon(BuildContext context) => null;

  @override
  String getLabel(BuildContext context) => 'Basic info';
}
