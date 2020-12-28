import 'package:engineering_thesis/components/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/components/custom_widgets/buttons/custom_button.dart';
import 'package:engineering_thesis/components/templates/center_screen.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:flutter/material.dart';

class RegistrationTab extends NavBarTab {
  final Activity activity;

  RegistrationTab({@required this.activity});

  @override
  Widget build(BuildContext context) {
    return CenterScreen(
      content: Column(
        children: [
          CustomButton.raisedButton(
            text: 'Zapisz się na aktywność.',
          )
        ],
      ),
    );
  }

  @override
  Icon getIcon(BuildContext context) => null;

  @override
  String getLabel(BuildContext context) => 'Registration';
}
