import 'package:engineering_thesis/blocs/abstract_blocs/nav_bar/nav_bar_bloc.dart';
import 'package:engineering_thesis/components/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/screens/activity_details/top_nav_bar_tabs/attendees/attendees_screen.dart';
import 'package:engineering_thesis/screens/activity_details/top_nav_bar_tabs/details/description_screen.dart';
import 'package:meta/meta.dart';

class ActivityDetailsTopNavbarBloc extends NavBarBloc {
  final int initialIndex;
  final Activity activity;

  ActivityDetailsTopNavbarBloc({
    @required this.activity,
    this.initialIndex = 0,
  });

  List<NavBarTab> get navBarTabs => [
        DescriptionScreen(activity: activity),
        AttendeesScreen(activity: activity),
      ];
}
