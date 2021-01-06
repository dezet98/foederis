import 'package:engineering_thesis/blocs/abstract_blocs/nav_bar/nav_bar_bloc.dart';
import 'package:engineering_thesis/ui/components/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/ui/screens/guest/guest_info_tab.dart';
import 'package:engineering_thesis/ui/screens/home/bottom_nav_bar_tabs/search_activities/search_activities_tab.dart';

class HomeGuestScreenBottomNavBarBloc extends NavBarBloc {
  int initialIndex = 0;

  HomeGuestScreenBottomNavBarBloc();

  @override
  List<NavBarTab> get navBarTabs => [
        SearchActivitiesTab(),
        GuestInfoTab(),
      ];
}
