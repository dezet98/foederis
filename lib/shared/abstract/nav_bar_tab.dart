import 'package:flutter/widgets.dart';

abstract class NavBarTab extends StatelessWidget {
  String get label;
  Icon getIcon(BuildContext context);
}
