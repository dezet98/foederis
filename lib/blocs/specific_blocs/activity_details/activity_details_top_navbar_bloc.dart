import 'package:engineering_thesis/blocs/abstract_blocs/nav_bar/nav_bar_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/authorization/user_data/user_data_bloc.dart';
import 'package:engineering_thesis/components/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/components/bloc_builders/send/send_builder_button.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/models/attendee.dart';
import 'package:engineering_thesis/models/collections/attendee_collection.dart';
import 'package:engineering_thesis/repositories/activity_repository.dart';
import 'package:engineering_thesis/repositories/attendee_repository.dart';
import 'package:engineering_thesis/screens/activity_details/top_nav_bar_tabs/attendees/attendees_tab.dart';
import 'package:engineering_thesis/screens/activity_details/top_nav_bar_tabs/chat/chat_tab.dart';
import 'package:engineering_thesis/screens/activity_details/top_nav_bar_tabs/description/description_tab.dart';
import 'package:engineering_thesis/screens/activity_details/top_nav_bar_tabs/map/activity_details_map_tab.dart';
import 'package:engineering_thesis/screens/activity_details/top_nav_bar_tabs/registration/free_join/free_join_registration_tab.dart';
import 'package:engineering_thesis/screens/activity_details/top_nav_bar_tabs/registration/organizer_appeal_to_join/organizer_appeal_to_join_tab.dart';
import 'package:engineering_thesis/screens/activity_details/top_nav_bar_tabs/registration/records/records_registration_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'attendees/cancel_attendee_send_bloc.dart';
import 'cancel_activity/cancel_activity_send_bloc.dart';

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
      if (userIsNotAttendee) ..._forNotAttendee(),
      if (!userIsNotAttendee) ..._forAttendee(),
      ActivityDetailsMapTab(activity: activity),
    ];
  }

  List<NavBarTab> _forNotAttendee() {
    List<NavBarTab> resultList = [];

    resultList.add(
      DescriptionTab(
        activity: activity,
        attendees: attendees,
      ),
    );

    if (activity.freeJoin)
      resultList.add(
          FreeJoinRegistrationTab(activity: activity, attendees: attendees));
    else
      resultList.add(
          RecordsRegistrationTab(activity: activity, attendees: attendees));

    resultList.add(AttendeesTab(
      activity: activity,
      attendees: attendees,
      attendee: null,
    ));

    return resultList;
  }

  List<NavBarTab> _forAttendee() {
    Attendee userAttendee = attendees
        .where((el) => el.userRef.id == _userDataBloc.user.ref.id)
        .first;

    List<NavBarTab> resultList = [ChatTab(activity: activity)];

    resultList.add(
      DescriptionTab(
        activity: activity,
        attendees: attendees,
        cancelActivityButton: (userAttendee.role == AttendeeRole.maker &&
                !activity.isCancel &&
                !activity.isFinish)
            ? _cancelActivityButton()
            : null,
        cancelInvolvementButton: ((userAttendee.role == AttendeeRole.attendee ||
                    userAttendee.role == AttendeeRole.coorganizer) &&
                !activity.isCancel &&
                !activity.isFinish &&
                !userAttendee.isCancel)
            ? _cancelInvolvementButton(userAttendee)
            : null,
      ),
    );

    // display requests tab if user is organizator and activity is not freeJoin, and is not canceled
    if (!activity.freeJoin &&
        (userAttendee.role == AttendeeRole.maker ||
            userAttendee.role == AttendeeRole.coorganizer) &&
        !activity.isCancel &&
        !userAttendee.isCancel &&
        !activity.isFinish)
      resultList.add(
          OrganizerAppealToJoinTab(activity: activity, attendees: attendees));

    resultList.add(AttendeesTab(
      activity: activity,
      attendees: attendees,
      attendee: userAttendee,
    ));

    return resultList;
  }

  Widget _cancelActivityButton() {
    return Builder(
      builder: (context) {
        return SendBuilderButton(
          sendBloc: CancelActivitySendBloc(
            RepositoryProvider.of<ActivityRepository>(context),
            activity: activity,
          ),
          sendButtonText:
              S.of(context).activity_details_screen_cancel_activity_button_text,
        );
      },
    );
  }

  Widget _cancelInvolvementButton(Attendee attendee) {
    return Builder(
      builder: (context) {
        return SendBuilderButton(
          sendBloc: CancelAttendeeSendBloc(
            RepositoryProvider.of<AttendeeRepository>(context),
            attendee: attendee,
          ),
          sendButtonText: S
              .of(context)
              .activity_details_screen_cancel_involvement_button_text,
        );
      },
    );
  }
}
