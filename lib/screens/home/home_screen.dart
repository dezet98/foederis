import 'package:engineering_thesis/screens/home/bottom_nav_bar_content/my_activities/my_activities_screen.dart';
import 'package:engineering_thesis/shared/app_logger.dart';
import 'package:engineering_thesis/shared/templates/template_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'bottom_nav_bar_content/my_activities/settings/settings_screen.dart';
import 'bottom_nav_bar_content/search_activities/search_activities_screen.dart';

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
      [SearchActivitiesScreen(), MyActivitiesScreen(), SettingsHomeContent()];

  List<BottomNavigationBarItem> get _homeNavBarItems => [
        BottomNavigationBarItem(
          icon: Icon(PlatformIcons(context).search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(PlatformIcons(context).book),
          label: 'My activity',
        ),
        BottomNavigationBarItem(
          icon: Icon(PlatformIcons(context).settings),
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
