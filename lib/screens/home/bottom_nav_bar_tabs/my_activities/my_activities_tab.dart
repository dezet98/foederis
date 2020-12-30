import 'package:engineering_thesis/blocs/specific_blocs/activity_details/activity_stream_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/authorization/user_data/user_data_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/create_activity/create_activity_send_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/my_activities/my_activities_stream_bloc.dart';
import 'package:engineering_thesis/components/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/components/bloc_builders/stream_bloc_builder.dart';
import 'package:engineering_thesis/components/custom_widgets/buttons/custom_button.dart';
import 'package:engineering_thesis/components/custom_widgets/list/custom_list.dart';
import 'package:engineering_thesis/components/custom_widgets/list/custom_list_tile.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/models/attendee.dart';
import 'package:engineering_thesis/repositories/activity_repository.dart';
import 'package:engineering_thesis/repositories/attendee_repository.dart';
import 'package:engineering_thesis/shared/utils/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../../blocs/specific_blocs/create_activity/create_activity_form_data.dart';
import '../../../../generated/l10n.dart';
import '../../../../shared/routing.dart';
import '../../../../shared/theme.dart';

class MyActivitiesTab extends NavBarTab {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        child: _buildFloatingButton(context),
        right: Dimensions.gutterMedium,
        bottom: Dimensions.gutterMedium,
      ),
      _buildTabProviders(),
    ]);
  }

  Widget _buildTabProviders() {
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
                buildSuccess: (activity) => _buildTile(
                  context,
                  activity as Activity,
                  attendee,
                ),
              ),
            ),
          );
        });
  }

  Widget _buildTile(
      BuildContext context, Activity activity, Attendee attendee) {
    return CustomListTile(
      title: activity.title,
      subtitle: enumToString(attendee.role),
      onTap: () {
        Routing.pushNamed(context, UserRoutes.activityDetails,
            options: {RoutingOption.activity: activity});
      },
    );
  }

  Widget _buildFloatingButton(BuildContext context) {
    return CustomButton.floatingButton(
      materialIconData: Icons.add,
      cupertinoIconData: CupertinoIcons.add,
      onPressed: () {
        Routing.pushNamed(
          context,
          UserRoutes.form,
          options: {
            RoutingOption.formDataBloc:
                BlocProvider.of<CreateActvityFormDataBloc>(context),
            RoutingOption.formAppBarTitle:
                S.of(context).create_activity_screen_nav_title,
            RoutingOption.formNextButtonText: 'fsd',
            RoutingOption.sendBloc:
                BlocProvider.of<CreateActivitySendBloc>(context),
          },
        );
      },
    );
  }

  @override
  Icon getIcon(BuildContext context) => Icon(PlatformIcons(context).book);

  @override
  String getLabel(context) => S.of(context).home_screen_my_activity_tab_name;
}
