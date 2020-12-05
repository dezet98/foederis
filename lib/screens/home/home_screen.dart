import 'package:engineering_thesis/blocs/abstract_blocs/nav_bar/nav_bar_bloc.dart';
import 'package:engineering_thesis/blocs/auth/auth_bloc.dart';
import 'package:engineering_thesis/screens/home/bottom_nav_bar_content/my_activities/my_activities_screen.dart';
import 'package:engineering_thesis/screens/home/bottom_nav_bar_content/settings/settings_screen.dart';
import 'package:engineering_thesis/shared/builders/nav_bar.dart';
import 'package:engineering_thesis/shared/providers.dart';
import 'package:engineering_thesis/shared/routing.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bottom_nav_bar_content/search_activities/search_activities_screen.dart';

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
      content: [
        SearchActivitiesScreen(),
        MyActivitiesScreen(),
        SettingsScreen()
      ],
      navBarBloc: BlocProvider.of<NavBarBloc>(context),
    );
  }
}
