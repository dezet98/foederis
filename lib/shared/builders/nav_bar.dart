import 'package:engineering_thesis/blocs/nav_bar/nav_bar_bloc.dart';
import 'package:engineering_thesis/shared/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/shared/templates/template_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class NavBar extends StatelessWidget {
  final NavBarBloc navBarBloc;
  final List<NavBarTab> content;

  NavBar({@required this.navBarBloc, @required this.content});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      cubit: navBarBloc,
      builder: (context, state) {
        return TemplateScreen(
          body: content
              .elementAt(BlocProvider.of<NavBarBloc>(context).currentIndex),
          usePadding: false,
          platformNavBar: PlatformNavBar(
            currentIndex: BlocProvider.of<NavBarBloc>(context).currentIndex,
            items: _homeNavBarItems(context, content),
            itemChanged: (int index) {
              BlocProvider.of<NavBarBloc>(context)
                  .add(NavBarItemChangedEvent(index: index));
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
