import 'package:engineering_thesis/components/custom_widgets/app_bars/custom_app_bar.dart';
import 'package:engineering_thesis/components/templates/template_screen.dart';
import 'package:engineering_thesis/shared/constants/enums.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../blocs/specific_blocs/authorization/auth/auth_bloc.dart';
import '../../blocs/specific_blocs/authorization/login/login_bloc.dart';
import '../../generated/l10n.dart';
import '../../shared/routing.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController =
      TextEditingController(text: "d@g.com");
  final TextEditingController _passwordController =
      TextEditingController(text: "123456aa");
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: _loginBlocListener,
      child: _buildLoginScreen(),
    );
  }

  Widget _buildLoginScreen() {
    return TemplateScreen(
      platformAppBar: CustomAppBar(
        title: 'Login',
      ),
      body: Column(
        children: [
          PlatformTextField(controller: _emailController),
          PlatformTextField(
            controller: _passwordController,
          ),
          PlatformButton(
            onPressed: () =>
                Routing.pushReplacement(context, GuestRoutes.register),
            child: Text(S.of(context).text_button_go_to_register),
          ),
          PlatformButton(
            onPressed: loading
                ? null
                : () {
                    BlocProvider.of<LoginBloc>(context).add(
                      LoginWithEmailAndPasswordEvent(
                          email: _emailController.text,
                          password: _passwordController.text),
                    );
                  },
            child: loading
                ? PlatformCircularProgressIndicator()
                : Text('log in with credentials'),
          )
        ],
      ),
    );
  }

  void _loginBlocListener(BuildContext context, LoginState state) {
    if (state is LoginInProgressState) {
      setState(() {
        loading = true;
      });
    } else if (state is LoginFailureState) {
      String text;
      switch (state.loginException.loginError) {
        case LoginError.bad_credentials:
          text = S.of(context).bad_credentials;
          break;
        case LoginError.undefined:
          text = state.loginException.message;
          break;
      }
      setState(() {
        loading = false;
        showPlatformModalSheet(context: context, builder: (_) => Text(text));
      });
    } else if (state is LoginSuccessState) {
      if (BlocProvider.of<AuthBloc>(context).state
          is AuthUserAuthenticatedState) {
        Routing.pushReplacement(context, UserRoutes.home);
      } else {
        Routing.pushReplacement(context, CommonRoutes.splash);
      }
    }
  }
}
