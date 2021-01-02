import 'package:engineering_thesis/blocs/specific_blocs/authorization/user_data/user_data_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/settings/update_user_data_form_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/settings/update_user_data_send_bloc.dart';
import 'package:engineering_thesis/components/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/components/custom_widgets/buttons/custom_button.dart';
import 'package:engineering_thesis/components/custom_widgets/icon/custom_icon.dart';
import 'package:engineering_thesis/repositories/user_repository.dart';
import 'package:engineering_thesis/shared/remote_storage.dart';
import 'package:engineering_thesis/shared/routing.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../../blocs/specific_blocs/authorization/auth/auth_bloc.dart';
import '../../../../generated/l10n.dart';
import 'localization_change.dart';

class SettingsTab extends NavBarTab {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(54.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CustomButton.applyForm(
            text: S.of(context).home_screen_settings_tab_edit_profile,
            onPressed: () {
              Routing.pushNamed(context, UserRoutes.form, options: {
                RoutingOption.formDataBloc: UpdateUserDataFormBloc(
                  appUser: BlocProvider.of<UserDataBloc>(context).user,
                ),
                RoutingOption.formAppBarTitle:
                    S.of(context).update_user_form_nav_bar_title,
                RoutingOption.formNextButtonText:
                    S.of(context).update_user_form_apply_button,
                RoutingOption.sendBloc: UpdateUserDataSendBloc(
                  RepositoryProvider.of<UserRepository>(context),
                  BlocProvider.of<UserDataBloc>(context),
                  RepositoryProvider.of<RemoteStorage>(context),
                ),
                RoutingOption.afterSuccess: () {
                  Navigator.pop(context);

                  BlocProvider.of<UserDataBloc>(context)
                      .add(UserDataRefreshEvent());
                }
              });
            },
          ),
          LocalizationChange(),
          PlatformButton(
            child: isMaterial(context)
                ? Text('change to Cupertino')
                : Text('change to Material'),
            onPressed: () {
              if (isMaterial(context)) {
                PlatformProvider.of(context).changeToCupertinoPlatform();
              } else {
                PlatformProvider.of(context).changeToMaterialPlatform();
              }
            },
          ),
          CustomButton.goToOtherScreen(
            text: S.of(context).home_screen_settings_tab_log_out,
            onPressed: () =>
                BlocProvider.of<AuthBloc>(context).add(AuthSignOutEvent()),
          ),
        ],
      ),
    );
  }

  @override
  Widget getIcon(BuildContext context) => CustomIcon.settingsBottomTab;

  @override
  String getLabel(context) => S.of(context).home_screen_account_tab_name;
}
