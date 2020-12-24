import 'package:engineering_thesis/components/custom_widgets/app_bars/custom_app_bar.dart';
import 'package:engineering_thesis/components/templates/template_screen.dart';
import 'package:engineering_thesis/shared/constants/enums.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../blocs/specific_blocs/authorization/auth/auth_bloc.dart';
import '../../blocs/specific_blocs/authorization/register/register_bloc.dart';
import '../../generated/l10n.dart';
import '../../shared/routing.dart';

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
    return BlocListener<RegisterBloc, RegisterState>(
      listener: registerBlocListener,
      child: _buildRegisterScreen(),
    );
  }

  Widget _buildRegisterScreen() {
    return TemplateScreen(
      platformAppBar: CustomAppBar(
        title: 'Register',
      ),
      body: Column(
        children: [
          PlatformTextField(controller: _emailController),
          PlatformTextField(
            controller: _passwordController,
          ),
          PlatformButton(
            onPressed: () =>
                Routing.pushReplacement(context, GuestRoutes.login),
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
      if (BlocProvider.of<AuthBloc>(context).state
          is AuthUserAuthenticatedState) {
        Routing.pushReplacement(context, UserRoutes.home);
      } else {
        Routing.pushReplacement(context, CommonRoutes.splash);
      }
    }
  }
}
