import 'package:engineering_thesis/blocs/specific_blocs/home_screen/home_screen_bottom_nav_bar_bloc.dart';
import 'package:engineering_thesis/components/bloc_builders/nav_bar.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/specific_blocs/authorization/auth/auth_bloc.dart';
import '../../shared/providers.dart';
import '../../shared/routing.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: getHomeScreenBlocProviders(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthUserUnauthenticatedState) {
            Routing.pushNamedAndRemoveUntil(context, CommonRoutes.splash,
                CommonRoutes.splash); // TODO change security maybe
          }
        },
        child: Builder(
          builder: (context) => _buildNavBarScreen(context),
        ),
      ),
    );
  }

  Widget _buildNavBarScreen(BuildContext context) {
    return NavBar(
      navBarBloc: BlocProvider.of<HomeScreenBottomNavBarBloc>(context),
    );
  }
}
