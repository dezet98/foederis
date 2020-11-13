import 'package:engineering_thesis/screens/home/contents/settings_home_content.dart';
import 'package:engineering_thesis/shared/app_logger.dart';
import 'package:engineering_thesis/shared/templates/template_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      body: homeScreenContents.elementAt(_selectedIndex),
      platformNavBar: PlatformNavBar(
        currentIndex: _selectedIndex,
        items: _homeNavBarItems,
        itemChanged: itemChanged,
      ),
    );
  }

  List<Widget> get homeScreenContents =>
      [SettingsHomeContent(), SettingsHomeContent()];

  List<BottomNavigationBarItem> get _homeNavBarItems => [
        BottomNavigationBarItem(
          icon: Icon(Icons.all_inbox),
          label: 'Activity',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined),
          label: 'Account',
        ),
      ];

  void itemChanged(int index) {
    AppLogger().log(
      message: // TODO
          'Changing HomeScreenContent: \'${homeScreenContents[_selectedIndex].toStringShort()}\' -> \'${homeScreenContents[index].toStringShort()}\'',
      logLevel: LogLevel.info,
    );
    setState(() {
      _selectedIndex = index;
    });
  }
}
