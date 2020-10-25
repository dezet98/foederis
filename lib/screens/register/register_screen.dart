import 'package:engineering_thesis/blocs/auth/auth_bloc.dart';
import 'package:engineering_thesis/blocs/register/register_bloc.dart';
import 'package:engineering_thesis/constants/enums.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/shared/routing.dart';
import 'package:engineering_thesis/shared/templates/template_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController =
      TextEditingController(text: "d@g.com");
  final TextEditingController _passwordController =
      TextEditingController(text: "123456aa");
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is AuthUserAuthenticatedState) {
        return Routing.onGenerate(UserRoutes.home);
      }
      return _buildRegisterScreen();
    });
  }

  Widget _buildRegisterScreen() {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: registerBlocListener,
      child: TemplateScreen(
        platformAppBar: PlatformAppBar(
          title: Text(S.of(context).app_bar_title_register),
        ),
        body: Column(
          children: [
            PlatformTextField(controller: _emailController),
            PlatformTextField(
              controller: _passwordController,
            ),
            PlatformButton(
              onPressed: () =>
                  Routing.popAndPushNamed(context, GuestRoutes.login),
              child: Text(S.of(context).text_button_go_to_login),
            ),
            PlatformButton(
              onPressed: loading
                  ? null
                  : () {
                      BlocProvider.of<RegisterBloc>(context).add(
                        RegisterUserWithEmailAndPasswordEvent(
                          email: _emailController.text,
                          password: _passwordController.text,
                        ),
                      );
                    },
              child: loading
                  ? PlatformCircularProgressIndicator()
                  : Text('register'),
            )
          ],
        ),
      ),
    );
  }

  void registerBlocListener(BuildContext context, RegisterState state) {
    if (state is RegisterInProgressState) {
      setState(() {
        loading = true;
      });
    } else if (state is RegisterFailureState) {
      String text;
      switch (state.registerException.registerError) {
        case RegisterError.email_already_in_use:
          text = S.of(context).bad_credentials;
          break;
        case RegisterError.invalid_email:
          text = S.of(context).bad_credentials;
          break;
        case RegisterError.operation_not_allowed:
          text = S.of(context).bad_credentials;
          break;
        case RegisterError.weak_password:
          text = S.of(context).bad_credentials;
          break;
        case RegisterError.undefined:
          text = S.of(context).bad_credentials;
          break;
      }
      setState(() {
        loading = false;
        showPlatformModalSheet(context: context, builder: (_) => Text(text));
      });
    } else if (state is RegisterSuccessState) {
      setState(() {
        loading = false;
      });
    }
  }
}
