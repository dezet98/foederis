import 'package:engineering_thesis/blocs/specific_blocs/activity_details/attendee_fetch_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/common/user_fetch_bloc.dart';
import 'package:engineering_thesis/components/bloc_builders/fetching_bloc_builder.dart';
import 'package:engineering_thesis/components/custom_widgets/avatar/custom_user_avatar.dart';
import 'package:engineering_thesis/components/custom_widgets/chips/custom_chip.dart';
import 'package:engineering_thesis/components/custom_widgets/clock/custom_clock.dart';
import 'package:engineering_thesis/components/custom_widgets/gesture_detector/custom_gesture_detector.dart';
import 'package:engineering_thesis/components/custom_widgets/list/custom_list_tile.dart';
import 'package:engineering_thesis/components/custom_widgets/text/cutom_text.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/models/app_user.dart';
import 'package:engineering_thesis/models/attendee.dart';
import 'package:engineering_thesis/repositories/attendee_repository.dart';
import 'package:engineering_thesis/repositories/user_repository.dart';
import 'package:engineering_thesis/shared/routing.dart';
import 'package:engineering_thesis/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;

  ActivityCard({@required this.activity});

  @override
  Widget build(BuildContext context) {
    return _fetchingActivityMaker(context);
  }

  Widget _fetchingActivityMaker(BuildContext context) {
    return FetchingBlocBuilder(
      fetchingCubit: UserFetchBloc(
        RepositoryProvider.of<UserRepository>(context),
        userRef: activity.userRef,
      ),
      buildSuccess: (userApp) => _fetchingActivityAttendees(
        context,
        userApp as AppUser,
      ),
    );
  }

  Widget _fetchingActivityAttendees(BuildContext context, AppUser maker) {
    return FetchingBlocBuilder(
      fetchingCubit: AttendeeFetchBloc(
        RepositoryProvider.of<AttendeeRepository>(context),
        activityRef: activity.ref,
      ),
      buildSuccess: (attendees) => _buildListTile(
        context,
        maker,
        attendees as List<Attendee>,
      ),
    );
  }

  Widget _buildListTile(
      BuildContext context, AppUser maker, List<Attendee> attendees) {
    return CustomListTile(
      title: activity.title,
      content: _buildContent(context, attendees),
      onTap: () => _goToActivityDetails(context),
      leading: _buildLeading(context, maker),
    );
  }

  Widget _buildContent(BuildContext context, List<Attendee> attendees) {
    return Wrap(
      children: [
        CustomChip.label(label: activity.category.title),
        SizedBox(width: Dimensions.gutterSmall),
        CustomChip.label(
            label: '${attendees.length.toString()}/${activity.maxEntry}'),
        SizedBox(width: Dimensions.gutterSmall),
        CustomChip.label(label: _joinWay(context)),
        SizedBox(width: Dimensions.gutterSmall),
        CustomChip.common(child: CustomClock(child: _timeToStart(context))),
      ],
    );
  }

  Widget _timeToStart(context) {
    Duration timeToStart = activity.startDate.difference(DateTime.now());

    return CustomText.chipLabel(
        '${S.of(context).plural_days(timeToStart.inDays)} ${S.of(context).plural_hours(timeToStart.inHours % 60)} ${S.of(context).plural_minutes(timeToStart.inMinutes % 60)}');
  }

  String _joinWay(BuildContext context) {
    return activity.freeJoin
        ? S.of(context).activity_card_free_join
        : S.of(context).activity_card_registration;
  }

  Widget _buildLeading(BuildContext context, AppUser maker) {
    return CustomGestureDetector(
      onTap: () {
        Routing.pushNamed(context, UserRoutes.profile,
            options: {RoutingOption.userRef: maker.ref});
      },
      child: CustomUserAvatar.fromUrl(context, maker.photoUrl,
          diameter: MediaQuery.of(context).size.width / 8),
    );
  }

  void _goToActivityDetails(BuildContext context) {
    Routing.pushNamed(context, UserRoutes.activityDetails,
        options: {RoutingOption.activity: activity});
  }
}
