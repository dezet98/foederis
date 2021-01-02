import 'package:engineering_thesis/blocs/abstract_blocs/nav_bar/nav_bar_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/authorization/user_data/user_data_bloc.dart';
import 'package:engineering_thesis/components/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/models/attendee.dart';
import 'package:engineering_thesis/models/collections/attendee_collection.dart';
import 'package:engineering_thesis/screens/activity_details/top_nav_bar_tabs/attendees/attendees_tab.dart';
import 'package:engineering_thesis/screens/activity_details/top_nav_bar_tabs/chat/chat_tab.dart';
import 'package:engineering_thesis/screens/activity_details/top_nav_bar_tabs/description/description_tab.dart';
import 'package:engineering_thesis/screens/activity_details/top_nav_bar_tabs/map/activity_details_map_tab.dart';
import 'package:engineering_thesis/screens/activity_details/top_nav_bar_tabs/registration/free_join/free_join_registration_tab.dart';
import 'package:engineering_thesis/screens/activity_details/top_nav_bar_tabs/registration/organizer_appeal_to_join/organizer_appeal_to_join_tab.dart';
import 'package:engineering_thesis/screens/activity_details/top_nav_bar_tabs/registration/records/records_registration_tab.dart';
import 'package:meta/meta.dart';

class ActivityDetailsTopNavbarBloc extends NavBarBloc {
  final UserDataBloc _userDataBloc;
  final int initialIndex;
  final Activity activity;
  final List<Attendee> attendees;

  ActivityDetailsTopNavbarBloc(
    this._userDataBloc, {
    @required this.activity,
    @required this.attendees,
    this.initialIndex = 0,
  });

  List<NavBarTab> get navBarTabs {
    bool userIsNotAttendee = attendees
            .where((el) => el.userRef.id == _userDataBloc.user.ref.id)
            .length ==
        0;

    return [
      DescriptionTab(activity: activity, attendees: attendees),
      if (userIsNotAttendee) ..._forNotAttendee(),
      if (!userIsNotAttendee) ..._forAttendee(),
      ActivityDetailsMapTab(activity: activity),
    ];
  }

  List<NavBarTab> _forNotAttendee() {
    List<NavBarTab> resultList = [];

    if (activity.freeJoin)
      resultList.add(
          FreeJoinRegistrationTab(activity: activity, attendees: attendees));
    else
      resultList.add(
          RecordsRegistrationTab(activity: activity, attendees: attendees));

    resultList.add(AttendeesTab(
      activity: activity,
      attendees: attendees,
      attendeeRole: null,
    ));

    return resultList;
  }

  List<NavBarTab> _forAttendee() {
    Attendee user = attendees
        .where((el) => el.userRef.id == _userDataBloc.user.ref.id)
        .first;

    List<NavBarTab> resultList = [ChatTab(activity: activity)];

    // display requests tab if user is organizator and activity is not freeJoin
    if (!activity.freeJoin && user.role == AttendeeRole.maker ||
        user.role == AttendeeRole.coorganizer)
      resultList.add(
          OrganizerAppealToJoinTab(activity: activity, attendees: attendees));

    resultList.add(AttendeesTab(
      activity: activity,
      attendees: attendees,
      attendeeRole: user.role,
    ));

    return resultList;
  }
}
