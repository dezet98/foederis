import 'package:engineering_thesis/blocs/specific_blocs/home_screen/home_screen_bottom_nav_bar_bloc.dart';
import 'package:engineering_thesis/components/templates/template_screen.dart';
import 'package:engineering_thesis/shared/routing.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/specific_blocs/authorization/auth/auth_bloc.dart';
import '../../shared/providers.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: getHomeScreenBlocProviders(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthUserUnauthenticatedState) {
            Routing.pushNamedAndRemoveUntil(
                context, CommonRoutes.splash, CommonRoutes.splash);
          }
        },
        child: Builder(
          builder: (context) => _buildNavBarScreen(context),
        ),
      ),
    );
  }

  Widget _buildNavBarScreen(BuildContext context) {
    return TemplateScreen.bottomNavbar(
      context: context,
      navBarBloc: BlocProvider.of<HomeScreenBottomNavBarBloc>(context),
      usePadding: false,
    );
  }
}
