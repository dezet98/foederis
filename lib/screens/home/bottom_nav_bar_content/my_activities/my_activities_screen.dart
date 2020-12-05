import 'package:engineering_thesis/shared/abstract/nav_bar_tab.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class MyActivitiesScreen extends NavBarTab {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(54.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text('My activities screen'),
        ],
      ),
    );
  }

  @override
  Icon getIcon(BuildContext context) => Icon(PlatformIcons(context).book);

  @override
  String get label => 'My activity';
}
