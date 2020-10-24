import 'package:engineering_thesis/repositories/auth_repository.dart';
import 'package:engineering_thesis/shared/templates/template_screen.dart';
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
            child: Text(
                'sign out'), // todo be aware that somebody can click that more than one time
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
