import 'package:engineering_thesis/blocs/specific_blocs/common/user_fetch_bloc.dart';
import 'package:engineering_thesis/components/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/components/bloc_builders/fetching_bloc_builder.dart';
import 'package:engineering_thesis/components/custom_widgets/list/custom_list.dart';
import 'package:engineering_thesis/components/custom_widgets/list/custom_list_tile.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/models/app_user.dart';
import 'package:engineering_thesis/models/attendee.dart';
import 'package:engineering_thesis/models/collections/attendee_collection.dart';
import 'package:engineering_thesis/repositories/user_repository.dart';
import 'package:engineering_thesis/shared/routing.dart';
import 'package:engineering_thesis/shared/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttendeesTab extends NavBarTab {
  final Activity activity;
  final List<Attendee> attendees;
  final AttendeeRole attendeeRole;

  AttendeesTab(
      {@required this.activity,
      @required this.attendees,
      @required this.attendeeRole});

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  Widget _buildList(context) {
    return CustomList<Attendee>(
      items: attendees,
      buildTile: (Attendee attendee) => _buildUserTile(context, attendee),
    );
  }

  Widget _buildUserTile(context, Attendee attendee) {
    return FetchingBlocBuilder(
      fetchingCubit: UserFetchBloc(
        RepositoryProvider.of<UserRepository>(context),
        userRef: attendee.userRef,
      ),
      buildSuccess: (appUser) {
        return CustomListTile(
          title:
              '${(appUser as AppUser).firstName} ${(appUser as AppUser).secondName}',
          subtitle: enumToString(attendee.role),
          onTap: () {
            Routing.pushNamed(context, UserRoutes.profile,
                options: {RoutingOption.userRef: (appUser as AppUser).ref});
          },
        );
      },
    );
  }

  bool get isMaker => attendeeRole == AttendeeRole.maker;

  bool get isCoorganizer => attendeeRole == AttendeeRole.coorganizer;

  @override
  Icon getIcon(BuildContext context) => null;

  @override
  String getLabel(BuildContext context) => 'Attendees';
}
