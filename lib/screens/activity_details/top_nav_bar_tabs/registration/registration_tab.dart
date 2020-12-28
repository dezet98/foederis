import 'package:engineering_thesis/blocs/abstract_blocs/send/send_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/activity_details/activity_details_register_send_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/authorization/user_data/user_data_bloc.dart';
import 'package:engineering_thesis/components/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/components/custom_widgets/buttons/custom_button.dart';
import 'package:engineering_thesis/components/templates/center_screen.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/repositories/attendee_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationTab extends NavBarTab {
  final Activity activity;

  RegistrationTab({@required this.activity});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ActivityDetailsRegisterSendBloc(
        RepositoryProvider.of<AttendeeRepository>(context),
        userRef: RepositoryProvider.of<UserDataBloc>(context).user.ref,
        activity: activity,
      ),
      child: Builder(
        builder: (context) {
          return CenterScreen(
            content: Column(
              children: [
                CustomButton.raisedButton(
                  text: 'Zapisz się na aktywność.',
                  onPressed: () {
                    BlocProvider.of<ActivityDetailsRegisterSendBloc>(context)
                        .add(SendDataEvent());
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Icon getIcon(BuildContext context) => null;

  @override
  String getLabel(BuildContext context) => 'Registration';
}