import 'package:engineering_thesis/blocs/specific_blocs/authorization/auth/auth_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/authorization/user_data/user_data_bloc.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/shared/routing/routing.dart';
import 'package:engineering_thesis/shared/view/theme.dart';
import 'package:engineering_thesis/ui/components/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/ui/components/custom_widgets/buttons/custom_button.dart';
import 'package:engineering_thesis/ui/components/custom_widgets/icon/custom_icon.dart';
import 'package:engineering_thesis/ui/components/custom_widgets/text/cutom_text.dart';
import 'package:engineering_thesis/ui/components/templates/center_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'localization_change.dart';

class SettingsTab extends NavBarTab {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CenterScreen(
        content: Padding(
          padding: const EdgeInsets.all(Dimensions.screenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CustomButton.applyForm(
                  text: S.of(context).home_screen_settings_tab_show_profile,
                  onPressed: () {
                    Routing.pushNamed(context, UserRoutes.profile, options: {
                      RoutingOption.userRef:
                          BlocProvider.of<UserDataBloc>(context).user.ref,
                      RoutingOption.withContactInfo: true,
                    });
                  }),
              SizedBox(height: Dimensions.gutterMedium),
              Row(
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
              SizedBox(height: Dimensions.gutterMedium),
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

  @override
  Widget getIcon(BuildContext context) => CustomIcon.settingsBottomTab;

  @override
  String getLabel(context) => S.of(context).home_screen_account_tab_name;
}
