import 'package:engineering_thesis/blocs/auth/auth_bloc.dart';
import 'package:engineering_thesis/shared/templates/template_screen.dart';
import 'package:engineering_thesis/shared/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: authBlocListener,
      child: TemplateScreen(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PlatformButton(
              child: Text(
                  'sign out'), // todo be aware that somebody can click that more than one time
              onPressed: () =>
                  BlocProvider.of<AuthBloc>(context).add(AuthSignOutEvent()),
            ),
            PlatformButton(
              child: Text('settings'),
              onPressed: () => Navigator.pushNamed(context, Routes.settings),
            ),
          ],
        ),
      ),
    );
  }

  void authBlocListener(context, state) {
    // todo maybe alert, to check
  }
}
