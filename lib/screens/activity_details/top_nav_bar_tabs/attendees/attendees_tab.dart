import 'package:engineering_thesis/components/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:flutter/material.dart';

class AttendeesTab extends NavBarTab {
  final Activity activity;

  AttendeesTab({@required this.activity});

  @override
  Widget build(BuildContext context) {
    return Text('Ahoj');
  }

  @override
  Icon getIcon(BuildContext context) => null;

  @override
  String getLabel(BuildContext context) => 'Attendees';
}
