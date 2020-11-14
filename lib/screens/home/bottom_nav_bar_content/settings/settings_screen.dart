import 'package:engineering_thesis/blocs/auth/auth_bloc.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
              setState(() {
                S.load(
                  Locale('en', 'US'),
                );
              });
            },
          ),
          PlatformButton(
            child: Text('pl'),
            onPressed: () {
              setState(() {
                S.load(
                  Locale('pl', 'PL'),
                );
              });
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
}
