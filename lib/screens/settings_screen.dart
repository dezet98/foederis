import 'package:engineering_thesis/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:engineering_thesis/shared/components/template_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      platformAppBar: PlatformAppBar(
        title: Text(S.of(context).settings),
      ),
      body: Padding(
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
            )
          ],
        ),
      ),
    );
  }
}
