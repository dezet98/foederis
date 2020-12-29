import 'package:engineering_thesis/blocs/abstract_blocs/nav_bar/nav_bar_bloc.dart';
import 'package:engineering_thesis/components/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/models/attendee.dart';
import 'package:engineering_thesis/screens/activity_details/top_nav_bar_tabs/attendees/attendees_tab.dart';
import 'package:engineering_thesis/screens/activity_details/top_nav_bar_tabs/description/description_tab.dart';
import 'package:engineering_thesis/screens/activity_details/top_nav_bar_tabs/map/activity_details_map_tab.dart';
import 'package:engineering_thesis/screens/activity_details/top_nav_bar_tabs/registration/registration_tab.dart';
import 'package:meta/meta.dart';

class ActivityDetailsTopNavbarBloc extends NavBarBloc {
  final int initialIndex;
  final Activity activity;
  final List<Attendee> attendees;

  ActivityDetailsTopNavbarBloc({
    @required this.activity,
    @required this.attendees,
    this.initialIndex = 0,
  });

  List<NavBarTab> get navBarTabs => [
        DescriptionTab(activity: activity),
        if (activity.startDate.isAfter(DateTime.now()))
          RegistrationTab(activity: activity, attendees: attendees),
        AttendeesTab(
          activity: activity,
          attendees: attendees,
        ),
        ActivityDetailsMapTab(activity: activity),
      ];
}
