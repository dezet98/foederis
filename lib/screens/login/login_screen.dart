import 'package:engineering_thesis/components/custom_widgets/buttons/custom_button.dart';
import 'package:engineering_thesis/components/custom_widgets/snack_bar.dart/custom_snack_bar.dart';
import 'package:engineering_thesis/components/custom_widgets/text_form_field/custom_text_form_field.dart';
import 'package:engineering_thesis/components/templates/template_screen.dart';
import 'package:engineering_thesis/shared/constants/enums.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/specific_blocs/authorization/auth/auth_bloc.dart';
import '../../blocs/specific_blocs/authorization/login/login_bloc.dart';
import '../../generated/l10n.dart';
import '../../shared/routing.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController =
      TextEditingController(text: "d@g.com");
  final TextEditingController _passwordController =
      TextEditingController(text: "123456aa");

  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: _loginBlocListener,
        builder: _loginBlocBuilder,
      ),
    );
  }

  Widget _loginBlocBuilder(context, state) {
    if (state is LoginInProgressState) return _buildLoginContent(context, true);
    return _buildLoginContent(context, false);
  }

  Widget _buildLoginContent(context, bool loading) {
    return Column(
      children: [
        CustomTextFormField.normal(
          textEditingController: _emailController,
          enabled: !loading,
          placeholder: S.of(context).login_screen_email_placeholder,
        ),
        CustomTextFormField.normal(
            textEditingController: _passwordController,
            enabled: !loading,
            obscureText: true,
            placeholder: S.of(context).login_screen_password_placeholder),
        CustomButton.goToOtherScreen(
          text: S.of(context).login_screen_go_to_register,
          onPressed: () => _navigateToRegister(context),
          enabled: !loading,
        ),
        CustomButton.goToOtherScreen(
          text: S.of(context).login_screen_visit_as_a_guest,
          onPressed: () => _navigateToHomeAsAGuest(context),
          enabled: !loading,
        ),
        if (!loading)
          CustomButton.applyForm(
            text: S.of(context).login_screen_login,
            onPressed: () => _loginOnPressed(context),
          ),
        if (loading) CustomButton.loadingButton(),
      ],
    );
  }

  void _loginBlocListener(BuildContext context, LoginState state) {
    if (state is LoginSuccessState) {
      if (BlocProvider.of<AuthBloc>(context).state
          is AuthUserAuthenticatedState) {
        Routing.pushReplacement(context, UserRoutes.home);
      } else {
        Routing.pushReplacement(context, CommonRoutes.splash);
      }
    } else if (state is LoginFailureState) {
      switch (state.loginException.loginError) {
        case LoginError.bad_credentials:
          CustomSnackBar.showErrorSnackBar(context,
              message: S.of(context).login_error_bad_credentials);
          break;
        case LoginError.undefined:
          CustomSnackBar.showErrorSnackBar(context,
              message: S.of(context).login_error_undefined);
          break;
      }
    }
  }

  void _loginOnPressed(context) {
    BlocProvider.of<LoginBloc>(context).add(
      LoginWithEmailAndPasswordEvent(
          email: _emailController.text, password: _passwordController.text),
    );
  }

  void _navigateToRegister(context) {
    Routing.pushNamed(context, GuestRoutes.register);
  }

  void _navigateToHomeAsAGuest(context) {
    Routing.pushNamedAndRemoveUntil(
        context, GuestRoutes.guestHome, GuestRoutes.guestHome);
  }
}
