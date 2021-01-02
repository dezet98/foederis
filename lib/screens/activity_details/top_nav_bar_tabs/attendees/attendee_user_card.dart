import 'package:engineering_thesis/blocs/specific_blocs/activity_details/attendees/give_up_coorganizer_right_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/activity_details/attendees/grant_coorganizer_rights_send_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/common/user_fetch_bloc.dart';
import 'package:engineering_thesis/components/bloc_builders/send/send_builder_button.dart';
import 'package:engineering_thesis/components/custom_widgets/buttons/custom_button.dart';
import 'package:engineering_thesis/components/custom_widgets/icon/custom_icon.dart';
import 'package:engineering_thesis/components/custom_widgets/list/custom_list_tile.dart';
import 'package:engineering_thesis/components/custom_widgets/popup_menu/custom_popup_menu.dart';
import 'package:engineering_thesis/components/custom_widgets/popup_menu/custom_popup_menu_item.dart';
import 'package:engineering_thesis/components/custom_widgets/text/cutom_text.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/models/app_user.dart';
import 'package:engineering_thesis/models/attendee.dart';
import 'package:engineering_thesis/models/collections/attendee_collection.dart';
import 'package:engineering_thesis/repositories/attendee_repository.dart';
import 'package:engineering_thesis/repositories/user_repository.dart';
import 'package:engineering_thesis/shared/routing.dart';
import 'package:engineering_thesis/shared/utils/dates.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../components/bloc_builders/fetching_bloc_builder.dart';

class AttendeeUserCard extends StatelessWidget {
  final Attendee attendee;
  final AttendeeRole attendeeRole;

  AttendeeUserCard({@required this.attendee, @required this.attendeeRole});

  @override
  Widget build(BuildContext context) {
    return FetchingBlocBuilder(
      fetchingCubit: UserFetchBloc(
        RepositoryProvider.of<UserRepository>(context),
        userRef: attendee.userRef,
      ),
      buildSuccess: (appUser) {
        return CustomListTile(
          title:
              '${(appUser as AppUser).firstName} ${(appUser as AppUser).secondName}',
          content: _buildContent(context),
          onTap: () {
            Routing.pushNamed(context, UserRoutes.profile,
                options: {RoutingOption.userRef: (appUser as AppUser).ref});
          },
        );
      },
    );
  }

  Widget _buildContent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomText.menuTitle(S
                    .of(context)
                    .activity_details_screen_attendee_tab_join_date),
                CustomText.bodyText(
                    formatDate('dd-MM-yyyy hh:mm', attendee.joinDate)),
              ],
            ),
            Row(
              children: [
                CustomText.menuTitle(
                    S.of(context).activity_details_screen_attendee_tab_role),
                CustomText.bodyText(
                  AttendeeCollection.attendeeToString(context, attendee.role),
                ),
              ],
            ),
          ],
        ),
        _buildMenuButton(context, attendee) ?? Container(),
      ],
    );
  }

  CustomPopupMenu _buildMenuButton(context, Attendee attendee) {
    List<PopupMenuItem> menuItems = [];

    if (!isMaker) return null;

    if (isMaker) {
      Widget item = _grantRightsMenuItem(context);
      if (item != null) menuItems.add(item);
      item = _giveRightsUpMenuItem(context);
      if (item != null) menuItems.add(item);
    }

    return menuItems.length > 0
        ? CustomPopupMenu(
            customButton: CustomButton.iconButton(customIcon: CustomIcon.more),
            popupMenuItems: menuItems,
          )
        : null;
  }

  Widget _grantRightsMenuItem(context) {
    if (attendee.role == AttendeeRole.attendee)
      return CustomPopupMenuItem.it(
        SendBuilderButton(
          afterSuccess: () {
            Routing.pop(context);
          },
          sendBloc: GrantCoorganizerRightsSendBloc(
            RepositoryProvider.of<AttendeeRepository>(context),
            attendee: attendee,
          ),
          sendButtonText: S
              .of(context)
              .activity_details_screen_attendee_tab_grant_organizator_grants,
        ),
      );
    return null;
  }

  Widget _giveRightsUpMenuItem(context) {
    if (attendee.role == AttendeeRole.coorganizer)
      return CustomPopupMenuItem.it(
        SendBuilderButton(
          afterSuccess: () {
            Routing.pop(context);
          },
          sendBloc: GiveUpCoorganizerRightsSendBloc(
            RepositoryProvider.of<AttendeeRepository>(context),
            attendee: attendee,
          ),
          sendButtonText: S
              .of(context)
              .activity_details_screen_attendee_tab_give_organizator_rights_up,
        ),
      );
    return null;
  }

  bool get isMaker => attendeeRole == AttendeeRole.maker;

  bool get isCoorganizer => attendeeRole == AttendeeRole.coorganizer;
}
