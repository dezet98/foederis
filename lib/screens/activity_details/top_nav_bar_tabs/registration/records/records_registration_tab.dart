import 'package:engineering_thesis/blocs/abstract_blocs/fetch/fetch_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/activity_details/registration/records/appeal_to_join_cancel_send_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/activity_details/registration/records/appeal_to_join_create_send_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/activity_details/registration/records/appeal_to_join_fetch_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/activity_details/registration/records/appeal_to_join_form_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/authorization/user_data/user_data_bloc.dart';
import 'package:engineering_thesis/components/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/components/bloc_builders/fetching_bloc_builder.dart';
import 'package:engineering_thesis/components/bloc_builders/forms/form_data_screen.dart';
import 'package:engineering_thesis/components/bloc_builders/send_with_validator/send_builder_button.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/models/appeal_to_join.dart';
import 'package:engineering_thesis/models/attendee.dart';
import 'package:engineering_thesis/repositories/appeal_to_join_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecordsRegistrationTab extends NavBarTab {
  final Activity activity;
  final List<Attendee> attendees;

  RecordsRegistrationTab({@required this.attendees, @required this.activity});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppealToJoinBloc(
            RepositoryProvider.of<AppealToJoinRepository>(context),
            userRef: RepositoryProvider.of<UserDataBloc>(context).user.ref,
            activityRef: activity.ref,
          ),
        ),
      ],
      child: Builder(
        builder: (context) {
          return FetchingBlocBuilder(
            fetchingCubit: BlocProvider.of<AppealToJoinBloc>(context),
            buildSuccess: (appealToJoin) {
              if (appealToJoin == null) return _buildAppealToJoinForm(context);
              return _buildCancelAppealToJoinForm(context, appealToJoin);
            },
          );
        },
      ),
    );
  }

  // situation when we can send request with comment to join
  Widget _buildAppealToJoinForm(context) {
    return FormDataScreen(
      formDataBloc: AppealToJoinFormBloc(),
      formAppBarTitle: null,
      formNextButtonText: 'Appeal to join',
      sendBloc: AppealToJoinCreateSendBloc(
        RepositoryProvider.of<AppealToJoinRepository>(context),
        activityRef: activity.ref,
        userRef: RepositoryProvider.of<UserDataBloc>(context).user.ref,
      ),
      afterSuccess: () {
        BlocProvider.of<AppealToJoinBloc>(context).add(FetchRefreshEvent());
      },
    );
  }

// situation when we send request with comment to join and we waiting on decision
  Widget _buildCancelAppealToJoinForm(context, AppealToJoin appealToJoin) {
    return SendBuilderButton(
      sendBloc: AppealToJoinCancelSendBloc(
        RepositoryProvider.of<AppealToJoinRepository>(context),
        appealToJoinRef: appealToJoin.ref,
      ),
      sendButtonText: 'Anuluj prośbę o dołączenie',
      afterSuccess: () {
        BlocProvider.of<AppealToJoinBloc>(context).add(FetchRefreshEvent());
      },
    );
  }

  @override
  Widget getIcon(BuildContext context) => null;

  @override
  String getLabel(BuildContext context) => 'Registration';
}
