import 'package:engineering_thesis/repositories/auth_repository.dart';
import 'package:engineering_thesis/shared/components/template_screen.dart';
import 'package:engineering_thesis/shared/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PlatformButton(
            child: Text('login'),
            onPressed: () => Navigator.pushNamed(context, Routes.login),
          ),
          PlatformButton(
            child: Text('register'),
            onPressed: () => Navigator.pushNamed(context, Routes.register),
          ),
          PlatformButton(
            child: Text('sign out'),
            onPressed: () =>
                RepositoryProvider.of<AuthRepository>(context).signOut(),
          ),
          PlatformButton(
            child: Text('settings'),
            onPressed: () => Navigator.pushNamed(context, Routes.settings),
          ),
        ],
      ),
    );
  }
}
