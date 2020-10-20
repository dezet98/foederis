import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/repositories/auth_repository.dart';
import 'package:engineering_thesis/shared/components/template_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      platformAppBar: PlatformAppBar(
        title: Text("Login"),
      ),
      body: Column(
        children: [
          Center(
            child: Text(S.of(context).login),
          ),
          RaisedButton(
            onPressed: () {
              AuthRepository().signAnon();
            },
            child: Text('log in anon'),
          )
        ],
      ),
    );
  }
}
