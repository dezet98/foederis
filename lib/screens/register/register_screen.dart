import 'package:engineering_thesis/components/custom_widgets/app_bars/custom_app_bar.dart';
import 'package:engineering_thesis/components/custom_widgets/buttons/custom_button.dart';
import 'package:engineering_thesis/components/custom_widgets/snack_bar.dart/custom_snack_bar.dart';
import 'package:engineering_thesis/components/custom_widgets/text_form_field/custom_text_form_field.dart';
import 'package:engineering_thesis/components/templates/template_screen.dart';
import 'package:engineering_thesis/shared/constants/errors.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/specific_blocs/authorization/auth/auth_bloc.dart';
import '../../blocs/specific_blocs/authorization/register/register_bloc.dart';
import '../../generated/l10n.dart';
import '../../shared/routing/routing.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      platformAppBar: CustomAppBar(
        title: S.of(context).register_screen_nav_bar_title,
      ),
      body: BlocConsumer<RegisterBloc, RegisterState>(
        listener: _registerBlocListener,
        builder: _registerBlocBuilder,
      ),
    );
  }

  Widget _registerBlocBuilder(context, state) {
    if (state is RegisterInProgressState)
      return _buildRegisterContent(context, true);
    return _buildRegisterContent(context, false);
  }

  Widget _buildRegisterContent(BuildContext context, loading) {
    return Column(
      children: [
        CustomTextFormField.normal(
          textEditingController: _emailController,
          enabled: !loading,
          placeholder: S.of(context).register_screen_email_placeholder,
        ),
        CustomTextFormField.normal(
          textEditingController: _passwordController,
          enabled: !loading,
          obscureText: true,
          placeholder: S.of(context).register_screen_password_placeholder,
        ),
        if (!loading)
          CustomButton.applyForm(
            text: S.of(context).register_screen_register,
            onPressed: () => _registerOnPressed(context),
          ),
        if (loading) CustomButton.loadingButton(),
      ],
    );
  }

  void _registerBlocListener(BuildContext context, RegisterState state) {
    if (state is RegisterFailureState) {
      switch (state.registerException.registerError) {
        case RegisterError.email_already_in_use:
          CustomSnackBar.showErrorSnackBar(context,
              message: S.of(context).register_error_email_already_in_use);
          break;
        case RegisterError.invalid_email:
          CustomSnackBar.showErrorSnackBar(context,
              message: S.of(context).register_error_invalid_email);
          break;
        case RegisterError.operation_not_allowed:
          CustomSnackBar.showErrorSnackBar(context,
              message: S.of(context).register_error_operation_not_allowed);
          break;
        case RegisterError.weak_password:
          CustomSnackBar.showErrorSnackBar(context,
              message: S.of(context).register_error_email_weak_password);
          break;
        case RegisterError.undefined:
          CustomSnackBar.showErrorSnackBar(context,
              message: S.of(context).login_error_bad_credentials);
          break;
      }
    } else if (state is RegisterSuccessState) {
      if (BlocProvider.of<AuthBloc>(context).state
          is AuthUserAuthenticatedState) {
        Routing.pushReplacement(context, UserRoutes.home);
      } else {
        Routing.pushReplacement(context, CommonRoutes.splash);
      }
    }
  }

  void _registerOnPressed(context) {
    BlocProvider.of<RegisterBloc>(context).add(
      RegisterUserWithEmailAndPasswordEvent(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }
}
