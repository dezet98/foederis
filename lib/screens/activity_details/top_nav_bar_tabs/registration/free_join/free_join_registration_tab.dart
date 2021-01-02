import 'package:engineering_thesis/blocs/specific_blocs/activity_details/registration/free_join/free_join_registration_attendee_send_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/authorization/user_data/user_data_bloc.dart';
import 'package:engineering_thesis/components/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/components/bloc_builders/send/send_builder_button.dart';
import 'package:engineering_thesis/components/templates/center_screen.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/models/attendee.dart';
import 'package:engineering_thesis/repositories/attendee_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FreeJoinRegistrationTab extends NavBarTab {
  final Activity activity;
  final List<Attendee> attendees;

  FreeJoinRegistrationTab({@required this.attendees, @required this.activity});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FreeJoinRegistrationAttendeeSendBloc(
        RepositoryProvider.of<AttendeeRepository>(context),
        userRef: RepositoryProvider.of<UserDataBloc>(context).user.ref,
        activity: activity,
      ),
      child: Builder(
        builder: (context) {
          return BlocConsumer(
            cubit:
                BlocProvider.of<FreeJoinRegistrationAttendeeSendBloc>(context),
            listener: (context, state) {},
            builder: (context, state) {
              return _buildTab(context);
            },
          );
        },
      ),
    );
  }

  Widget _buildTab(BuildContext context) {
    return CenterScreen(
      content: Column(
        children: [
          SendBuilderButton(
            sendBloc:
                BlocProvider.of<FreeJoinRegistrationAttendeeSendBloc>(context),
            sendButtonText: 'Zapisz się na aktywność.',
          )
        ],
      ),
    );
  }

  @override
  Widget getIcon(BuildContext context) => null;

  @override
  String getLabel(BuildContext context) => 'Registration';
}
