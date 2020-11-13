import 'package:engineering_thesis/blocs/auth/auth_bloc.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SettingsHomeContent extends StatefulWidget {
  @override
  _SettingsHomeContentState createState() => _SettingsHomeContentState();
}

class _SettingsHomeContentState extends State<SettingsHomeContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(54.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            child: Text('en'),
            onPressed: () {
              setState(() {
                S.load(
                  Locale('en', 'US'),
                );
              });
            },
          ),
          RaisedButton(
            child: Text('pl'),
            onPressed: () {
              setState(() {
                S.load(
                  Locale('pl', 'PL'),
                );
              });
            },
          ),
          RaisedButton(
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
          RaisedButton(
            child: Text(
              'sign out',
            ), // TODO be aware that somebody can click that more than one time
            onPressed: () => BlocProvider.of<AuthBloc>(context).add(
                AuthSignOutEvent()), // TODO create alert and send to splash screen or sth
          ),
        ],
      ),
    );
  }
}
