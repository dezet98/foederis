import 'package:engineering_thesis/blocs/abstract_blocs/send/send_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/activity_details/registration/free_join/free_join_registration_send_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/activity_details/registration/free_join/free_join_registration_send_validators.dart';
import 'package:engineering_thesis/blocs/specific_blocs/authorization/user_data/user_data_bloc.dart';
import 'package:engineering_thesis/components/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/components/bloc_builders/send_with_validator/send_with_validator.dart';
import 'package:engineering_thesis/components/custom_widgets/buttons/custom_button.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FreeJoinRegistrationSendBloc(
            RepositoryProvider.of<AttendeeRepository>(context),
            userRef: RepositoryProvider.of<UserDataBloc>(context).user.ref,
            activity: activity,
          ),
        ),
        BlocProvider(
          create: (context) => FreeJoinRegistrationSendValidators(
            BlocProvider.of<UserDataBloc>(context),
            attendees: attendees,
            activity: activity,
          ),
        )
      ],
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
          SendWithValidator(
            validatorsBloc:
                BlocProvider.of<FreeJoinRegistrationSendValidators>(context),
            sendBloc: BlocProvider.of<FreeJoinRegistrationSendBloc>(context),
            invalidSendButton: _buildSendButton(context, false),
            validSendButton: _buildSendButton(context, true),
          )
        ],
      ),
    );
  }

  Widget _buildSendButton(context, enabled) {
    return BlocBuilder(
      cubit: BlocProvider.of<FreeJoinRegistrationSendBloc>(context),
      builder: (context, state) {
        if (state is SendDataInProgressState) {
          return CustomButton.loadingButton();
        }
        return CustomButton.raisedButton(
          text: 'Zapisz się na aktywność.',
          enabled: enabled,
          onPressed: () {
            BlocProvider.of<FreeJoinRegistrationSendBloc>(context)
                .add(SendDataEvent());
          },
        );
      },
    );
  }

  @override
  Icon getIcon(BuildContext context) => null;

  @override
  String getLabel(BuildContext context) => 'Registration';
}
