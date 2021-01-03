import 'package:engineering_thesis/blocs/abstract_blocs/nav_bar/nav_bar_bloc.dart';
import 'package:engineering_thesis/components/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/screens/home/bottom_nav_bar_tabs/my_activities/my_activities_tab.dart';
import 'package:engineering_thesis/screens/home/bottom_nav_bar_tabs/search_activities/search_activities_tab.dart';
import 'package:engineering_thesis/screens/home/bottom_nav_bar_tabs/settings/settings_tab.dart';

class HomeScreenBottomNavBarBloc extends NavBarBloc {
  int initialIndex = 0;

  HomeScreenBottomNavBarBloc();

  @override
  List<NavBarTab> get navBarTabs => [
        SearchActivitiesTab(),
        MyActivitiesTab(),
        SettingsTab(),
      ];
}
