import 'package:engineering_thesis/blocs/specific_blocs/authorization/login/login_bloc.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/ui/screens/login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fake_app.dart';

getBlocProviders() => [
      BlocProvider(
        create: (BuildContext context) => LoginBloc(
          authRepository: RemoteAuthServiceMock(),
        ),
      )
    ];

void main() {
  testWidgets('LoginScreen display correctly widgets',
      (WidgetTester tester) async {
    await tester.pumpWidget(FakeApp(
      child: LoginScreen(),
      blocProviders: getBlocProviders,
    ));

    await tester.pumpAndSettle();

    final loginFieldFinder =
        find.text(S.current.login_screen_email_placeholder);
    final passwordFieldFinder =
        find.text(S.current.login_screen_password_placeholder);
    final loginButtonFinder = find.text(S.current.login_screen_login);
    final navigateToRegisterButtonFinder =
        find.text(S.current.login_screen_go_to_register);
    final visitAsAGuestButtonFinder =
        find.text(S.current.login_screen_visit_as_a_guest);

    expect(loginFieldFinder, findsOneWidget);
    expect(passwordFieldFinder, findsOneWidget);
    expect(loginButtonFinder, findsOneWidget);
    expect(navigateToRegisterButtonFinder, findsOneWidget);
    expect(visitAsAGuestButtonFinder, findsOneWidget);
  });
}
