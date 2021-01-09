import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/fetch/fetch_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/activity_details/registration/maker_appeal_to_join/appeals_to_join_fetch_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/activity_details/registration/maker_appeal_to_join/maker_registration_attendee_reject_send_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/activity_details/registration/maker_appeal_to_join/maker_registration_attendee_send_bloc.dart';
import 'package:engineering_thesis/data/models/activity.dart';
import 'package:engineering_thesis/data/models/appeal_to_join.dart';
import 'package:engineering_thesis/data/models/attendee.dart';
import 'package:engineering_thesis/data/repositories/appeal_to_join_repository.dart';
import 'package:engineering_thesis/data/repositories/transaction_and_batch_repository.dart';
import 'package:engineering_thesis/data/repositories/user_repository.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/shared/routing/routing.dart';
import 'package:engineering_thesis/shared/utils/dates.dart';
import 'package:engineering_thesis/shared/view/theme.dart';
import 'package:engineering_thesis/ui/components/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/ui/components/bloc_builders/fetching_bloc_builder.dart';
import 'package:engineering_thesis/ui/components/bloc_builders/send/send_builder_button.dart';
import 'package:engineering_thesis/ui/components/custom_widgets/gesture_detector/custom_gesture_detector.dart';
import 'package:engineering_thesis/ui/components/custom_widgets/list/custom_list.dart';
import 'package:engineering_thesis/ui/components/custom_widgets/list/custom_list_tile.dart';
import 'package:engineering_thesis/ui/components/custom_widgets/text/cutom_text.dart';
import 'package:engineering_thesis/ui/components/templates/center_screen.dart';
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
              if ((appealsToJoin as List<AppealToJoin>).length == 0)
                return _buildNoResults(context);
              return _buildAppealsToJoinList(
                  context, appealsToJoin as List<AppealToJoin>);
            },
          );
        },
      ),
    );
  }

  Widget _buildNoResults(BuildContext context) {
    return CenterScreen(
      content: CustomText.screenInfoHeader(
          S.of(context).activity_details_screen_request_tab_no_results),
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
              return _buildTile(context, appealToJoin);
            },
          ),
        );
      },
    );
  }

  Widget _buildTile(BuildContext context, AppealToJoin appealToJoin) {
    return CustomGestureDetector(
      onTap: () {
        Routing.pushNamed(context, UserRoutes.profile, options: {
          RoutingOption.userRef: appealToJoin.userRef,
          RoutingOption.withContactInfo: true,
        });
      },
      child: CustomListTile(
        title:
            '${appealToJoin.user?.firstName} ${appealToJoin.user?.secondName} ${formatDate('dd-mm-yyyy hh:mm', appealToJoin.submissionDate)}',
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Dimensions.gutterVerySmall),
            CustomText.bodyText(
              appealToJoin?.comment ?? '',
            ),
            Row(children: _buildActionButtons(context, appealToJoin.ref)),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildActionButtons(context, DocumentReference appealToJoinRef) {
    return [
      SendBuilderButton(
        sendBloc: BlocProvider.of<MakerRegistrationAttendeeSendBloc>(context),
        sendButtonText:
            S.of(context).activity_details_screen_requests_tab_accept_request,
        afterSuccess: () {
          BlocProvider.of<AppealsToJoinFetchBloc>(context)
              .add(FetchRefreshEvent());
        },
      ),
      SendBuilderButton(
        sendBloc: MakerRegistrationAttendeeRejectSendBloc(
          RepositoryProvider.of<AppealToJoinRepository>(context),
          appealToJoinRef: appealToJoinRef,
        ),
        sendButtonText:
            S.of(context).activity_details_screen_requests_tab_reject_request,
        afterSuccess: () {
          BlocProvider.of<AppealsToJoinFetchBloc>(context)
              .add(FetchRefreshEvent());
        },
      ),
    ];
  }

  @override
  Widget getIcon(BuildContext context) => null;

  @override
  String getLabel(BuildContext context) =>
      S.of(context).activity_details_screen_requests_tab_join_title;
}
