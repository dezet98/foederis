import 'package:engineering_thesis/blocs/specific_blocs/home_guest/home_guest_screen_bottom_nav_bar_bloc.dart';
import 'package:engineering_thesis/components/templates/template_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/providers.dart';

class GuestHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: getHomeScreenBlocProviders(),
      child: _buildNavBarScreen(context),
    );
  }

  Widget _buildNavBarScreen(BuildContext context) {
    return TemplateScreen.bottomNavbar(
      context: context,
      navBarBloc: HomeGuestScreenBottomNavBarBloc(),
      usePadding: false,
    );
  }
}
