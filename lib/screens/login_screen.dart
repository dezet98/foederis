import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/repositories/auth_repository.dart';
import 'package:engineering_thesis/shared/components/template_screen.dart';
import 'package:engineering_thesis/shared/services/firebase_auth_service.dart';
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
              AuthRepository(firebaseAuthService: FirebaseAuthService())
                  .signAnon();
            },
            child: Text('log in anon'),
          )
        ],
      ),
    );
  }
}
