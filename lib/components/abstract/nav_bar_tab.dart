import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class NavBarTab extends StatelessWidget {
  String getLabel(BuildContext context);
  Widget getIcon(BuildContext context);
}
