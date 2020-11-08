import 'package:engineering_thesis/screens/settings_screen.dart';
import 'package:engineering_thesis/shared/app_logger.dart';
import 'package:engineering_thesis/shared/templates/template_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      body: homeScreenContents.elementAt(_selectedIndex),
      platformNavBar: PlatformNavBar(
        currentIndex: _selectedIndex,
        items: _homeNavBarItems,
        itemChanged: itemChanged,
      ),
    );
  }

  List<Widget> get homeScreenContents =>
      [SettingsScreen(), TemplateScreen(body: null)];

  List<BottomNavigationBarItem> get _homeNavBarItems => [
        BottomNavigationBarItem(
          icon: Icon(Icons.all_inbox),
          label: 'Activity',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.signal_cellular_4_bar_sharp),
          label: 'my',
        ),
      ];

  void itemChanged(int index) {
    AppLogger().log(
      message: // TODO
          'Changing HomeScreenContent: \'${homeScreenContents[_selectedIndex].toStringShort()}\' -> \'${homeScreenContents[index].toStringShort()}\'',
      logLevel: LogLevel.info,
    );
    setState(() {
      _selectedIndex = index;
    });
  }
}

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<AuthBloc, AuthState>(
//       listener: authBlocListener,
//       child: TemplateScreen(
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             PlatformButton(
//               child: Text(
//                   'sign out'), // TODO be aware that somebody can click that more than one time
//               onPressed: () => BlocProvider.of<AuthBloc>(context).add(
//                   AuthSignOutEvent()), //TODO create alert and send to splash screen or sth
//             ),
//             PlatformButton(
//               onPressed: () =>
//                   Routing.pushReplacement(context, GuestRoutes.login),
//               child: Text(S.of(context).text_button_go_to_login),
//             ),
//             PlatformButton(
//               child: Text('settings'),
//               onPressed: () => Routing.pushNamed(context, UserRoutes.settings),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void authBlocListener(context, state) {
//     // TODO maybe alert, to check
//   }
// }
