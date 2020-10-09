import 'package:engineering_thesis/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:engineering_thesis/shared/components/template_screen.dart';
import 'package:flutter/cupertino.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      appBar: AppBar(),
      body: Column(
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
          )
        ],
      ),
    );
  }
}
