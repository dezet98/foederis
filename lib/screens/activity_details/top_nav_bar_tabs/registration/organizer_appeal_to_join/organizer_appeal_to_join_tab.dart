import 'package:engineering_thesis/blocs/abstract_blocs/fetch/fetch_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/activity_details/registration/maker_appeal_to_join/appeals_to_join_fetch_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/activity_details/registration/maker_appeal_to_join/maker_registration_attendee_send_bloc.dart';
import 'package:engineering_thesis/components/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/components/bloc_builders/fetching_bloc_builder.dart';
import 'package:engineering_thesis/components/bloc_builders/send_with_validator/send_builder_button.dart';
import 'package:engineering_thesis/components/custom_widgets/list/custom_list.dart';
import 'package:engineering_thesis/components/custom_widgets/list/custom_list_tile.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/models/appeal_to_join.dart';
import 'package:engineering_thesis/models/attendee.dart';
import 'package:engineering_thesis/repositories/appeal_to_join_repository.dart';
import 'package:engineering_thesis/repositories/transaction_and_batch_repository.dart';
import 'package:engineering_thesis/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrganizerAppealToJoinTab extends NavBarTab {
  final Activity activity;
  final List<Attendee> attendees;

  OrganizerAppealToJoinTab({@required this.attendees, @required this.activity});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppealsToJoinFetchBloc(
        RepositoryProvider.of<AppealToJoinRepository>(context),
        RepositoryProvider.of<UserRepository>(context),
        activityRef: activity.ref,
      ),
      child: Builder(
        builder: (context) {
          return FetchingBlocBuilder(
            fetchingCubit: BlocProvider.of<AppealsToJoinFetchBloc>(context),
            buildSuccess: (appealsToJoin) {
              return _buildAppealsToJoinList(
                  context, appealsToJoin as List<AppealToJoin>);
            },
          );
        },
      ),
    );
  }

  Widget _buildAppealsToJoinList(
      BuildContext context, List<AppealToJoin> appealsToJoin) {
    return CustomList(
      items: appealsToJoin,
      buildTile: (AppealToJoin appealToJoin) {
        return BlocProvider(
          create: (context) => MakerRegistrationAttendeeSendBloc(
            RepositoryProvider.of<TransactionAndBatchRepository>(context),
            activity: activity,
            userRef: appealToJoin.userRef,
            appealToJoinRef: appealToJoin.ref,
          ),
          child: Builder(
            builder: (context) {
              return CustomListTile(
                title: appealToJoin.submissionDate.toString(),
                subtitle: appealToJoin.user?.firstName,
                actionButtons: _buildActionButtons(context),
              );
            },
          ),
        );
      },
    );
  }

  List<Widget> _buildActionButtons(context) {
    return [
      SendBuilderButton(
        sendBloc: BlocProvider.of<MakerRegistrationAttendeeSendBloc>(context),
        sendButtonText: 'accept',
        afterSuccess: () {
          BlocProvider.of<AppealsToJoinFetchBloc>(context)
              .add(FetchRefreshEvent());
        },
      )
    ];
  }

  @override
  Widget getIcon(BuildContext context) => null;

  @override
  String getLabel(BuildContext context) => 'Requests';
}
