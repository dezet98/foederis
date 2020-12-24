import 'package:engineering_thesis/components/abstract/nav_bar_tab.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../../blocs/specific_blocs/authorization/auth/auth_bloc.dart';
import '../../../../generated/l10n.dart';

class SettingsScreen extends NavBarTab {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(54.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          PlatformButton(
            child: Text('en'),
            onPressed: () {
              S.load(
                Locale('en', 'US'),
              );
            },
          ),
          PlatformButton(
            child: Text('pl'),
            onPressed: () {
              S.load(
                Locale('pl', 'PL'),
              );
            },
          ),
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
          PlatformButton(
            child: Text(
              'sign out',
            ), // TODO be aware that somebody can click that more than one time
            onPressed: () =>
                BlocProvider.of<AuthBloc>(context).add(AuthSignOutEvent()),
          ),
        ],
      ),
    );
  }

  @override
  Icon getIcon(BuildContext context) => Icon(PlatformIcons(context).settings);

  @override
  String getLabel(context) => S.of(context).home_screen_account_tab_name;
}
