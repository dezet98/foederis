import 'package:engineering_thesis/blocs/specific_blocs/activity_details/registration/free_join/free_join_registration_send_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/authorization/user_data/user_data_bloc.dart';
import 'package:engineering_thesis/components/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/components/bloc_builders/send_with_validator/send_builder.dart';
import 'package:engineering_thesis/components/templates/center_screen.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/models/attendee.dart';
import 'package:engineering_thesis/repositories/attendee_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MakerAppealToJoinTab extends NavBarTab {
  final Activity activity;
  final List<Attendee> attendees;

  MakerAppealToJoinTab({@required this.attendees, @required this.activity});

  @override
  Widget build(BuildContext context) {
    return Text('Maker');
    return BlocProvider(
      create: (context) => FreeJoinRegistrationSendBloc(
        RepositoryProvider.of<AttendeeRepository>(context),
        userRef: RepositoryProvider.of<UserDataBloc>(context).user.ref,
        activity: activity,
      ),
      child: Builder(
        builder: (context) {
          return BlocConsumer(
            cubit: BlocProvider.of<FreeJoinRegistrationSendBloc>(context),
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
          SendBuilder(
            sendBloc: BlocProvider.of<FreeJoinRegistrationSendBloc>(context),
            sendButtonText: 'Zapisz się na aktywność.',
          )
        ],
      ),
    );
  }

  @override
  Icon getIcon(BuildContext context) => null;

  @override
  String getLabel(BuildContext context) => 'Requests';
}
