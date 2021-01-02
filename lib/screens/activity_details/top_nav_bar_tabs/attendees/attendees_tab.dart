import 'package:engineering_thesis/blocs/specific_blocs/activity_details/attendees/give_up_coorganizer_right_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/activity_details/attendees/grant_coorganizer_rights_send_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/common/user_fetch_bloc.dart';
import 'package:engineering_thesis/components/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/components/bloc_builders/fetching_bloc_builder.dart';
import 'package:engineering_thesis/components/bloc_builders/send/send_builder_button.dart';
import 'package:engineering_thesis/components/custom_widgets/buttons/custom_button.dart';
import 'package:engineering_thesis/components/custom_widgets/icon/custom_icon.dart';
import 'package:engineering_thesis/components/custom_widgets/list/custom_list.dart';
import 'package:engineering_thesis/components/custom_widgets/list/custom_list_tile.dart';
import 'package:engineering_thesis/components/custom_widgets/popup_menu/custom_popup_menu.dart';
import 'package:engineering_thesis/components/custom_widgets/popup_menu/custom_popup_menu_item.dart';
import 'package:engineering_thesis/components/custom_widgets/text/cutom_text.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/models/app_user.dart';
import 'package:engineering_thesis/models/attendee.dart';
import 'package:engineering_thesis/models/collections/attendee_collection.dart';
import 'package:engineering_thesis/repositories/attendee_repository.dart';
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
          content: CustomText.bodyText(enumToString(attendee.role)),
          actionButtons: _buildActionMenuButton(context, attendee),
          onTap: () {
            Routing.pushNamed(context, UserRoutes.profile,
                options: {RoutingOption.userRef: (appUser as AppUser).ref});
          },
        );
      },
    );
  }

  List<Widget> _buildActionMenuButton(context, Attendee attendee) {
    return [
      if (isMaker)
        CustomPopupMenu(
          customButton: CustomButton.iconButton(customIcon: CustomIcon.more),
          popupMenuItems: [
            if (attendee.role == AttendeeRole.attendee)
              CustomPopupMenuItem.it(
                SendBuilderButton(
                  sendBloc: GrantCoorganizerRightsSendBloc(
                    RepositoryProvider.of<AttendeeRepository>(context),
                    attendee: attendee,
                  ),
                  sendButtonText: 'Nadaj prawa koorganizatora',
                ),
              ),
            if (attendee.role == AttendeeRole.coorganizer)
              CustomPopupMenuItem.it(
                SendBuilderButton(
                  sendBloc: GiveUpCoorganizerRightsSendBloc(
                    RepositoryProvider.of<AttendeeRepository>(context),
                    attendee: attendee,
                  ),
                  sendButtonText: 'Odbierz prawa koorganizowania',
                ),
              ),
          ],
        )
    ];
  }

  bool get isMaker => attendeeRole == AttendeeRole.maker;

  bool get isCoorganizer => attendeeRole == AttendeeRole.coorganizer;

  @override
  Widget getIcon(BuildContext context) => null;

  @override
  String getLabel(BuildContext context) => 'Attendees';
}
