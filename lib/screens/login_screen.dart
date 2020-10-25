import 'package:engineering_thesis/blocs/login/login_bloc.dart';
import 'package:engineering_thesis/constants/enums.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/shared/templates/template_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

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
      listener: loginBlocListener,
      child: TemplateScreen(
        platformAppBar: PlatformAppBar(
          title: Text("Login"),
        ),
        body: Column(
          children: [
            PlatformTextField(controller: _emailController),
            PlatformTextField(
              controller: _passwordController,
            ),
            RaisedButton(
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
      ),
    );
  }

  void loginBlocListener(BuildContext context, LoginState state) {
    if (state is LoginInProgressState) {
      setState(() {
        loading = true;
      });
    } else if (state is LoginFailureState) {
      String text;
      switch (state.loginError) {
        case LoginError.bad_credentials:
          text = S.of(context).bad_credentials;
          break;
        case LoginError.undefined:
          text = state.message;
          break;
      }
      setState(() {
        loading = false;
        showPlatformModalSheet(context: context, builder: (_) => Text(text));
      });
    } else if (state is LoginSuccessState) {
      setState(() {
        loading = false;
      });
    }
  }
}
