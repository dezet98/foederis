import 'package:engineering_thesis/components/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/components/custom_widgets/list/custom_list.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/models/attendee.dart';
import 'package:engineering_thesis/models/collections/attendee_collection.dart';
import 'package:engineering_thesis/screens/activity_details/top_nav_bar_tabs/attendees/attendee_user_card.dart';
import 'package:flutter/material.dart';

class AttendeesTab extends NavBarTab {
  final Activity activity;
  final List<Attendee> attendees;
  final AttendeeRole attendeeRole;

  AttendeesTab(
      {@required this.activity,
      @required this.attendees,
      @required this.attendeeRole});

  @override
  Widget build(BuildContext context) {
    return CustomList<Attendee>(
      items: attendees,
      buildTile: (Attendee attendee) => AttendeeUserCard(
        attendee: attendee,
        attendeeRole: attendeeRole,
      ),
    );
  }

  @override
  Widget getIcon(BuildContext context) => null;

  @override
  String getLabel(BuildContext context) =>
      S.of(context).activity_details_screen_attendee_tab_nav_bar_title;
}
