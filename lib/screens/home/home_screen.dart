import 'package:engineering_thesis/blocs/auth/auth_bloc.dart';
import 'package:engineering_thesis/screens/home/bottom_nav_bar_content/my_activities/my_activities_screen.dart';
import 'package:engineering_thesis/screens/home/bottom_nav_bar_content/settings/settings_screen.dart';
import 'package:engineering_thesis/shared/app_logger.dart';
import 'package:engineering_thesis/shared/providers.dart';
import 'package:engineering_thesis/shared/routing.dart';
import 'package:engineering_thesis/shared/templates/template_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'bottom_nav_bar_content/search_activities/search_activities_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

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
        child: TemplateScreen(
          body: homeScreenContents.elementAt(_selectedIndex),
          usePadding: false,
          platformNavBar: PlatformNavBar(
            currentIndex: _selectedIndex,
            items: _homeNavBarItems,
            itemChanged: itemChanged,
          ),
        ),
      ),
    );
  }

  List<Widget> get homeScreenContents =>
      [SearchActivitiesScreen(), MyActivitiesScreen(), SettingsScreen()];

  List<BottomNavigationBarItem> get _homeNavBarItems => [
        BottomNavigationBarItem(
          icon: Icon(PlatformIcons(context).search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(PlatformIcons(context).book),
          label: 'My activity',
        ),
        BottomNavigationBarItem(
          icon: Icon(PlatformIcons(context).settings),
          label: 'Account',
        ),
      ];

  void itemChanged(int index) {
    AppLogger().log(
      message:
          'Change HomeScreen Tab: \'${homeScreenContents[_selectedIndex].toStringShort()}\' -> \'${homeScreenContents[index].toStringShort()}\'',
      logLevel: LogLevel.info,
    );
    setState(() {
      _selectedIndex = index;
    });
  }
}
