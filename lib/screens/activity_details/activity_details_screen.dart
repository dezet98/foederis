import 'package:engineering_thesis/blocs/specific_blocs/activity_details/activity_details_top_navbar_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/activity_details/activity_stream_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/activity_details/attendee_stream_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/authorization/auth/auth_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/authorization/user_data/user_data_bloc.dart';
import 'package:engineering_thesis/components/bloc_builders/stream_bloc_builder.dart';
import 'package:engineering_thesis/components/templates/template_screen.dart';
import 'package:engineering_thesis/models/attendee.dart';
import 'package:engineering_thesis/repositories/activity_repository.dart';
import 'package:engineering_thesis/repositories/attendee_repository.dart';
import 'package:engineering_thesis/shared/providers.dart';
import 'package:engineering_thesis/shared/routing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/activity.dart';

class ActivityDetailsScreen extends StatelessWidget {
  final Activity activity;

  ActivityDetailsScreen({@required this.activity});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: getActivityDetailsScreenBlocProviders(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthUserUnauthenticatedState) {
            Routing.pushNamedAndRemoveUntil(context, CommonRoutes.splash,
                CommonRoutes.splash); // TODO change security maybe
          }
        },
        child: _buildStreamProviders(),
      ),
    );
  }

  Widget _buildStreamProviders() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ActivityStreamBloc(
            RepositoryProvider.of<ActivityRepository>(context),
            activityRef: activity.ref,
          ),
        ),
        BlocProvider(
          create: (context) => AttendeeStreamBloc(
            RepositoryProvider.of<AttendeeRepository>(context),
            activityRef: activity.ref,
          ),
        ),
      ],
      child: Builder(
        builder: (context) => StreamBlocBuilder(
          streamBloc: BlocProvider.of<ActivityStreamBloc>(context),
          buildSuccess: (activity) => Builder(
            builder: (context) => StreamBlocBuilder(
              streamBloc: BlocProvider.of<AttendeeStreamBloc>(context),
              buildSuccess: (attendees) => Builder(
                builder: (context) =>
                    _buildScreen(context, activity, attendees),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScreen(
      BuildContext context, Activity activity, List<Attendee> attendees) {
    return TemplateScreen.topNavbar(
      context: context,
      appBarTitle: activity.title,
      navBarBloc: ActivityDetailsTopNavbarBloc(
        BlocProvider.of<UserDataBloc>(context),
        activity: activity,
        attendees: attendees,
      ),
    );
  }
}
