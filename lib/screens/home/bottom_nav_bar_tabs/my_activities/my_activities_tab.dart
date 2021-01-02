import 'package:engineering_thesis/blocs/specific_blocs/activity_details/activity_stream_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/authorization/user_data/user_data_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/create_activity/create_activity_send_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/my_activities/my_activities_stream_bloc.dart';
import 'package:engineering_thesis/components/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/components/bloc_builders/cards/activity_card.dart';
import 'package:engineering_thesis/components/bloc_builders/stream_bloc_builder.dart';
import 'package:engineering_thesis/components/custom_widgets/buttons/custom_button.dart';
import 'package:engineering_thesis/components/custom_widgets/icon/custom_icon.dart';
import 'package:engineering_thesis/components/custom_widgets/list/custom_list.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/models/attendee.dart';
import 'package:engineering_thesis/repositories/activity_repository.dart';
import 'package:engineering_thesis/repositories/attendee_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/specific_blocs/create_activity/create_activity_form_data.dart';
import '../../../../generated/l10n.dart';
import '../../../../shared/routing.dart';
import '../../../../shared/theme.dart';

class MyActivitiesTab extends NavBarTab {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      _buildTabContent(),
      Positioned(
        child: _buildFloatingButton(context),
        right: Dimensions.gutterMedium,
        bottom: Dimensions.gutterMedium,
      ),
    ]);
  }

  /// deal with attendees with user stream and build it
  Widget _buildTabContent() {
    return BlocProvider(
      create: (context) => MyActivitiesStreamBloc(
        RepositoryProvider.of<AttendeeRepository>(context),
        BlocProvider.of<UserDataBloc>(context),
      ),
      child: Builder(
        builder: (context) => StreamBlocBuilder(
          streamBloc: BlocProvider.of<MyActivitiesStreamBloc>(context),
          buildSuccess: (attendees) {
            return _buildList(context, attendees as List<Attendee>);
          },
        ),
      ),
    );
  }

  /// deal with activity stream and build it
  Widget _buildList(context, List<Attendee> attendees) {
    return CustomList(
      items: attendees,
      buildTile: (Attendee attendee) {
        return BlocProvider(
          create: (context) => ActivityStreamBloc(
            RepositoryProvider.of<ActivityRepository>(context),
            activityRef: attendee.activityRef,
          ),
          child: Builder(
            builder: (context) => StreamBlocBuilder(
              streamBloc: BlocProvider.of<ActivityStreamBloc>(context),
              buildSuccess: (activity) =>
                  _buildTile(context, activity as Activity),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTile(BuildContext context, Activity activity) {
    return ActivityCard.myActivityCard(context, activity: activity);
  }

  Widget _buildFloatingButton(BuildContext context) {
    return CustomButton.floatingButton(
      customIcon: CustomIcon.add,
      onPressed: () {
        Routing.pushNamed(
          context,
          UserRoutes.form,
          options: {
            RoutingOption.formDataBloc:
                BlocProvider.of<CreateActvityFormDataBloc>(context),
            RoutingOption.formAppBarTitle:
                S.of(context).create_activity_screen_nav_bar_title,
            RoutingOption.formNextButtonText:
                S.of(context).create_activity_screen_apply_button_text,
            RoutingOption.sendBloc:
                BlocProvider.of<CreateActivitySendBloc>(context),
            RoutingOption.useStepper: true,
          },
        );
      },
    );
  }

  @override
  Widget getIcon(BuildContext context) => CustomIcon.myActivitiesBottomTab;

  @override
  String getLabel(context) => S.of(context).home_screen_my_activity_tab_name;
}
