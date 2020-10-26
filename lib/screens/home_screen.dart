import 'package:engineering_thesis/blocs/auth/auth_bloc.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/shared/routing.dart';
import 'package:engineering_thesis/shared/templates/template_screen.dart';
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
                  'sign out'), // TODO be aware that somebody can click that more than one time
              onPressed: () => BlocProvider.of<AuthBloc>(context).add(
                  AuthSignOutEvent()), //TODO create alert and send to splash screen or sth
            ),
            PlatformButton(
              onPressed: () =>
                  Routing.pushReplacement(context, GuestRoutes.login),
              child: Text(S.of(context).text_button_go_to_login),
            ),
            PlatformButton(
              child: Text('settings'),
              onPressed: () => Routing.pushNamed(context, UserRoutes.settings),
            ),
          ],
        ),
      ),
    );
  }

  void authBlocListener(context, state) {
    // TODO maybe alert, to check
  }
}
