import 'package:engineering_thesis/blocs/abstract_blocs/nav_bar/nav_bar_bloc.dart';
import 'package:engineering_thesis/components/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/components/templates/template_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class NavBar extends StatelessWidget {
  final NavBarBloc navBarBloc;

  NavBar({@required this.navBarBloc});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      cubit: navBarBloc,
      builder: (context, state) {
        return TemplateScreen(
          body: navBarBloc.currentTab,
          usePadding: false,
          platformNavBar: PlatformNavBar(
            currentIndex: navBarBloc.currentIndex,
            items: _homeNavBarItems(context, navBarBloc.navBarTabs),
            itemChanged: (int index) {
              navBarBloc.add(NavBarItemChangedEvent(index: index));
            },
          ),
        );
      },
    );
  }

  List<BottomNavigationBarItem> _homeNavBarItems(
          BuildContext context, List<NavBarTab> navBarContents) =>
      [
        for (NavBarTab navBarTab in navBarContents)
          BottomNavigationBarItem(
            icon: navBarTab.getIcon(context),
            label: navBarTab.getLabel(context),
          ),
      ];
}
