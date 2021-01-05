import 'package:engineering_thesis/blocs/specific_blocs/activity_details/user_attendees_fetch_bloc.dart';
import 'package:engineering_thesis/components/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/components/bloc_builders/fetching_bloc_builder.dart';
import 'package:engineering_thesis/components/custom_widgets/text/cutom_text.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/models/app_user.dart';
import 'package:engineering_thesis/models/attendee.dart';
import 'package:engineering_thesis/models/collections/attendee_collection.dart';
import 'package:engineering_thesis/repositories/attendee_repository.dart';
import 'package:engineering_thesis/shared/view/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class UserStatisticsTab extends NavBarTab {
  final AppUser appUser;

  UserStatisticsTab({@required this.appUser});

  @override
  Widget build(BuildContext context) {
    return FetchingBlocBuilder(
      fetchingCubit: UserAttendeesFetchBloc(
        RepositoryProvider.of<AttendeeRepository>(context),
        userRef: appUser.ref,
      ),
      buildSuccess: (attendees) =>
          _buildContent(context, attendees as List<Attendee>),
    );
  }

  Widget _buildContent(context, List<Attendee> attendees) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Wrap(
              children: [
                SizedBox(height: Dimensions.gutterMedium),
                _buildSingleAttribute(
                  context,
                  S.of(context).user_profile_screen_statistics_as_maker,
                  _makerActivities(attendees),
                ),
                _buildSingleAttribute(
                  context,
                  S.of(context).user_profile_screen_statistics_as_coorganizer,
                  _coorganizerActivities(attendees),
                ),
                _buildSingleAttribute(
                  context,
                  S.of(context).user_profile_screen_statistics_as_attendee,
                  _attendeeActivities(attendees),
                ),
                _buildSingleAttribute(
                  context,
                  S
                      .of(context)
                      .user_profile_screen_statistics_cancel_involvement,
                  _cancelInvolvement(attendees),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSingleAttribute(context, String subtitle, String text) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.gutterMedium),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: CustomText.menuTitle(subtitle, textAlign: TextAlign.left),
            ),
          ),
          CustomText.listItem(text),
          SizedBox(width: Dimensions.gutterLarge),
        ],
      ),
    );
  }

  String _makerActivities(List<Attendee> attendees) => attendees
      .where((e) => e.role == AttendeeRole.maker)
      .toList()
      .length
      .toString();

  String _coorganizerActivities(List<Attendee> attendees) => attendees
      .where((e) => e.role == AttendeeRole.coorganizer)
      .toList()
      .length
      .toString();

  String _attendeeActivities(List<Attendee> attendees) => attendees
      .where((e) => e.role == AttendeeRole.attendee)
      .toList()
      .length
      .toString();

  String _cancelInvolvement(List<Attendee> attendees) =>
      attendees.where((e) => e.isCancel == true).toList().length.toString();

  @override
  Widget getIcon(BuildContext context) => null;

  @override
  String getLabel(BuildContext context) =>
      S.of(context).user_profile_screen_statistics_nav_bar_title;
}
