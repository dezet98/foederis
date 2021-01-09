import 'package:engineering_thesis/blocs/specific_blocs/authorization/auth/auth_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/authorization/user_data/user_data_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/settings/update_user_data_form_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/settings/update_user_data_send_bloc.dart';
import 'package:engineering_thesis/data/repositories/user_repository.dart';
import 'package:engineering_thesis/data/services/remote_storage_service.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/shared/routing/routing.dart';
import 'package:engineering_thesis/shared/view/theme.dart';
import 'package:engineering_thesis/ui/components/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/ui/components/custom_widgets/avatar/custom_user_avatar.dart';
import 'package:engineering_thesis/ui/components/custom_widgets/buttons/custom_button.dart';
import 'package:engineering_thesis/ui/components/custom_widgets/gesture_detector/custom_gesture_detector.dart';
import 'package:engineering_thesis/ui/components/custom_widgets/icon/custom_icon.dart';
import 'package:engineering_thesis/ui/components/custom_widgets/text/cutom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'localization_change.dart';

class SettingsTab extends NavBarTab {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.screenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CustomGestureDetector(
                onTap: () {
                  Routing.pushNamed(context, UserRoutes.profile, options: {
                    RoutingOption.userRef:
                        BlocProvider.of<UserDataBloc>(context).user.ref,
                    RoutingOption.withContactInfo: true,
                  });
                },
                child: Column(
                  children: [
                    CustomUserAvatar.fromUrl(context,
                        BlocProvider.of<UserDataBloc>(context).user.photoUrl,
                        diameter: MediaQuery.of(context).size.width / 3),
                    SizedBox(height: Dimensions.gutterMedium),
                    Align(
                      alignment: Alignment.center,
                      child: CustomText.screenInfoHeader(
                        '${BlocProvider.of<UserDataBloc>(context).user.firstName ?? 'Daniel'} ${BlocProvider.of<UserDataBloc>(context).user.secondName ?? 'Zaczek'}',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Dimensions.gutterHuge),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText.screenInfoHeader(
                    S.of(context).home_screen_settings_tab_settings_label),
              ),
              CustomButton.goToOtherScreen(
                text: S.of(context).home_screen_settings_tab_edit_profile,
                onPressed: () => goToEditProfile(context),
              ),
              SizedBox(height: Dimensions.gutterMedium),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText.menuTitle(
                        S.of(context).home_screen_settings_tab_change_language),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: LocalizationChange(),
                  ),
                ],
              ),
              SizedBox(height: Dimensions.gutterMedium),
              PlatformButton(
                child: isMaterial(context)
                    ? CustomText.button('Cupertino')
                    : CustomText.button('Material'),
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
        ),
      ),
    );
  }

  void goToEditProfile(BuildContext context) {
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
        RepositoryProvider.of<RemoteStorageService>(context),
      ),
      RoutingOption.afterSuccess: () {
        Navigator.pop(context);

        BlocProvider.of<UserDataBloc>(context).add(UserDataRefreshEvent());
      }
    });
  }

  @override
  Widget getIcon(BuildContext context) => CustomIcon.settingsBottomTab;

  @override
  String getLabel(context) => S.of(context).home_screen_account_tab_name;
}
