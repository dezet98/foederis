import 'package:engineering_thesis/components/abstract/nav_bar_tab.dart';
import 'package:flutter/material.dart';

class AttendeesScreen extends NavBarTab {
  @override
  Widget build(BuildContext context) {
    return Text('Ahoj');
  }

  @override
  Icon getIcon(BuildContext context) {
    return Icon(Icons.ac_unit_sharp);
  }

  @override
  String getLabel(BuildContext context) {
    return 'Details';
  }
}
