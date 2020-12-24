import 'package:flutter/widgets.dart';

abstract class NavBarTab extends StatelessWidget {
  String getLabel(BuildContext context);
  Icon getIcon(BuildContext context);
}
