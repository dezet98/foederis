import 'package:engineering_thesis/blocs/abstract_blocs/nav_bar/nav_bar_bloc.dart';
import 'package:engineering_thesis/components/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/screens/home/bottom_nav_bar_content/my_activities/my_activities_screen.dart';
import 'package:engineering_thesis/screens/home/bottom_nav_bar_content/search_activities/search_activities_screen.dart';
import 'package:engineering_thesis/screens/home/bottom_nav_bar_content/settings/settings_screen.dart';

class HomeScreenBottomNavBarBloc extends NavBarBloc {
  final List<NavBarTab> navBarTabs = [
    SearchActivitiesScreen(),
    MyActivitiesScreen(),
    SettingsScreen()
  ];

  final int initialIndex = 0;
}
