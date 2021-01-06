import 'package:engineering_thesis/data/models/activity.dart';
import 'package:engineering_thesis/data/models/attendee.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/ui/components/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/ui/components/custom_widgets/list/custom_list.dart';
import 'package:flutter/material.dart';

import 'attendee_user_card.dart';

class AttendeesTab extends NavBarTab {
  final Activity activity;
  final List<Attendee> attendees;
  final Attendee attendee;

  AttendeesTab(
      {@required this.activity,
      @required this.attendees,
      @required this.attendee});

  @override
  Widget build(BuildContext context) {
    return CustomList<Attendee>(
      items: attendees,
      buildTile: (Attendee attendee) => AttendeeUserCard(
        attendee: attendee,
        attendeeRole: attendee.role,
      ),
    );
  }

  @override
  Widget getIcon(BuildContext context) => null;

  @override
  String getLabel(BuildContext context) =>
      S.of(context).activity_details_screen_attendee_tab_nav_bar_title;
}
