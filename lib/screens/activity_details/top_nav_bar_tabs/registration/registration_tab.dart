import 'package:engineering_thesis/blocs/abstract_blocs/send/send_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/validators/validators_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/activity_details/registration/activity_details_register_send_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/activity_details/registration/activity_details_register_send_validators.dart';
import 'package:engineering_thesis/blocs/specific_blocs/authorization/user_data/user_data_bloc.dart';
import 'package:engineering_thesis/components/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/components/bloc_builders/send_with_validator/send_with_validator.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ActivityDetailsRegisterSendBloc(
            RepositoryProvider.of<AttendeeRepository>(context),
            userRef: RepositoryProvider.of<UserDataBloc>(context).user.ref,
            activity: activity,
          ),
        ),
        BlocProvider(
          create: (context) => ActivityDetailsRegisterSendValidators(
            RepositoryProvider.of<AttendeeRepository>(context),
            BlocProvider.of<UserDataBloc>(context),
            activity: activity,
          ),
        )
      ],
      child: Builder(
        builder: (context) {
          return BlocConsumer(
            cubit: BlocProvider.of<ActivityDetailsRegisterSendBloc>(context),
            listener: (context, state) {
              if (state is SendDataSuccessState) {
                BlocProvider.of<ActivityDetailsRegisterSendValidators>(context)
                    .add(ValidatorsInitEvent());
              }
            },
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
                BlocProvider.of<ActivityDetailsRegisterSendValidators>(context),
            sendBloc: BlocProvider.of<ActivityDetailsRegisterSendBloc>(context),
            invalidSendButton: _buildSendButton(context, false),
            validSendButton: _buildSendButton(context, true),
          )
        ],
      ),
    );
  }

  Widget _buildSendButton(context, enabled) {
    return BlocBuilder(
      cubit: BlocProvider.of<ActivityDetailsRegisterSendBloc>(context),
      builder: (context, state) {
        if (state is SendDataInProgressState) {
          return CustomButton.loadingButton();
        }
        return CustomButton.raisedButton(
          text: 'Zapisz się na aktywność.',
          enabled: enabled,
          onPressed: () {
            BlocProvider.of<ActivityDetailsRegisterSendBloc>(context)
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
