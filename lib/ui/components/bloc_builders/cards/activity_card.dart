import 'package:engineering_thesis/blocs/specific_blocs/activity_details/attendee_fetch_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/activity_details/user_attendee_fetch_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/authorization/user_data/user_data_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/common/category_fetching_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/common/user_fetch_bloc.dart';
import 'package:engineering_thesis/data/models/activity.dart';
import 'package:engineering_thesis/data/models/category.dart';
import 'package:engineering_thesis/data/models/collections/attendee_collection.dart';
import 'package:engineering_thesis/data/repositories/attendee_repository.dart';
import 'package:engineering_thesis/data/repositories/category_repository.dart';
import 'package:engineering_thesis/data/repositories/user_repository.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/shared/routing/routing.dart';
import 'package:engineering_thesis/shared/view/theme.dart';
import 'package:engineering_thesis/ui/components/custom_widgets/avatar/custom_user_avatar.dart';
import 'package:engineering_thesis/ui/components/custom_widgets/chips/custom_chip.dart';
import 'package:engineering_thesis/ui/components/custom_widgets/clock/custom_clock.dart';
import 'package:engineering_thesis/ui/components/custom_widgets/gesture_detector/custom_gesture_detector.dart';
import 'package:engineering_thesis/ui/components/custom_widgets/list/custom_list_tile.dart';
import 'package:engineering_thesis/ui/components/custom_widgets/text/cutom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../fetching_bloc_builder.dart';

class ActivityCard {
  static Widget searchCard(BuildContext context,
      {@required Activity activity}) {
    return CustomListTile(
      title: activity.title,
      content: Wrap(
        children: [
          CustomChip.label(label: activity.category.titleAsString(context)),
          SizedBox(width: Dimensions.gutterSmall),
          _attendeeChip(context, activity),
          SizedBox(width: Dimensions.gutterSmall),
          _attendeeJoinWayChip(context, activity),
          SizedBox(width: Dimensions.gutterSmall),
          if (activity.startDate.isAfter(DateTime.now()))
            _startDateClockChip(context, activity),
        ],
      ),
      onTap: () {
        Routing.pushNamed(context, UserRoutes.activityDetails,
            options: {RoutingOption.activity: activity});
      },
      leading: _buildLeading(context, activity),
    );
  }

  static Widget myActivityCard(BuildContext context,
      {@required Activity activity}) {
    return CustomListTile(
      title: activity.title,
      content: Wrap(
        children: [
          CustomChip.label(label: activity.address),
          SizedBox(width: Dimensions.gutterSmall),
          _roleChip(context, activity),
          SizedBox(width: Dimensions.gutterSmall),
          _categoryChip(context, activity),
          SizedBox(width: Dimensions.gutterSmall),
          _activityStatusChip(context, activity),
          SizedBox(width: Dimensions.gutterSmall),
        ],
      ),
      onTap: () {
        Routing.pushNamed(context, UserRoutes.activityDetails,
            options: {RoutingOption.activity: activity});
      },
      leading: _buildLeading(context, activity),
    );
  }

  // chips
  static Widget _startDateClockChip(BuildContext context, Activity activity) {
    Duration timeToStart = activity.timeToStart;
    String text =
        '${S.of(context).plural_days(timeToStart.inDays)} ${S.of(context).plural_hours(timeToStart.inHours % 60)} ${S.of(context).plural_minutes(timeToStart.inMinutes % 60)}';

    return CustomChip.common(
        child: CustomClock(child: CustomText.chipLabel(text)));
  }

  static Widget _activityStatusChip(BuildContext context, Activity activity) {
    return FetchingBlocBuilder(
      fetchingCubit: AttendeeFetchBloc(
        RepositoryProvider.of<AttendeeRepository>(context),
        activityRef: activity.ref,
      ),
      buildSuccess: (attendees) => CustomChip.label(
        label: activity.status(context, attendees),
      ),
    );
  }

  static Widget _attendeeJoinWayChip(BuildContext context, Activity activity) {
    String text = activity.freeJoin
        ? S.of(context).activity_card_free_join
        : S.of(context).activity_card_registration;

    return CustomChip.label(label: text);
  }

  static Widget _attendeeChip(BuildContext context, Activity activity) {
    return FetchingBlocBuilder(
      fetchingCubit: AttendeeFetchBloc(
        RepositoryProvider.of<AttendeeRepository>(context),
        activityRef: activity.ref,
      ),
      buildSuccess: (attendees) => CustomChip.label(
          label: '${attendees.length.toString()}/${activity.maxEntry}'),
    );
  }

  static Widget _categoryChip(BuildContext context, Activity activity) {
    return FetchingBlocBuilder(
      fetchingCubit: CategoryFetchingBloc(
        categoryRepository: RepositoryProvider.of<CategoryRepository>(context),
        categoryRef: activity.categoryRef,
      ),
      buildSuccess: (category) => CustomChip.label(
          label: (category as Category).titleAsString(context)),
    );
  }

  static Widget _roleChip(BuildContext context, Activity activity) {
    return FetchingBlocBuilder(
      fetchingCubit: UserAttendeeFetchBloc(
        RepositoryProvider.of<AttendeeRepository>(context),
        activityRef: activity.ref,
        userRef: BlocProvider.of<UserDataBloc>(context).user.ref,
      ),
      buildSuccess: (attendee) => CustomChip.label(
          label:
              '${AttendeeCollection.attendeeToString(context, attendee.role)}'),
    );
  }

  static Widget _buildLeading(BuildContext context, activity) {
    return FetchingBlocBuilder(
      fetchingCubit: UserFetchBloc(
        RepositoryProvider.of<UserRepository>(context),
        userRef: activity.userRef,
      ),
      buildSuccess: (maker) => CustomGestureDetector(
        onTap: () {
          Routing.pushNamed(context, UserRoutes.profile,
              options: {RoutingOption.userRef: maker.ref});
        },
        child: CustomUserAvatar.fromUrl(context, maker.photoUrl,
            diameter: MediaQuery.of(context).size.width / 8),
      ),
    );
  }
}
