import 'package:engineering_thesis/blocs/abstract_blocs/nav_bar/nav_bar_bloc.dart';
import 'package:engineering_thesis/components/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/components/custom_widgets/app_bars/custom_app_bar.dart';
import 'package:engineering_thesis/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

enum TemplateScreenType {
  blank,
  bottom_navbar,
  top_navbar,
}

class TemplateScreen extends StatelessWidget {
  final Widget body;
  final CustomAppBar platformAppBar;
  final PlatformNavBar platformNavBar;
  final String routeName;
  final bool usePadding;

  TemplateScreen({
    @required this.body,
    this.routeName,
    this.platformAppBar,
    this.platformNavBar,
    this.usePadding = true,
  });

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: platformAppBar?.getPlatformAppBar(context),
      body: SafeArea(
        child: usePadding
            ? Padding(
                padding: const EdgeInsets.all(Dimensions.screenPadding),
                child: body,
              )
            : body,
      ),
      bottomNavBar: platformNavBar,
    );
  }

  static Widget bottomNavbar({
    @required BuildContext context,
    @required NavBarBloc navBarBloc,
    CustomAppBar platformAppBar,
    bool usePadding = true,
  }) {
    return BlocBuilder(
      cubit: navBarBloc,
      builder: (context, state) {
        return PlatformScaffold(
          appBar: platformAppBar?.getPlatformAppBar(context),
          body: usePadding
              ? Padding(
                  padding: const EdgeInsets.all(Dimensions.screenPadding),
                  child: navBarBloc.currentTab,
                )
              : navBarBloc.currentTab,
          bottomNavBar: PlatformNavBar(
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

  static List<BottomNavigationBarItem> _homeNavBarItems(
          BuildContext context, List<NavBarTab> navBarContents) =>
      [
        for (NavBarTab navBarTab in navBarContents)
          BottomNavigationBarItem(
            icon: navBarTab.getIcon(context),
            label: navBarTab.getLabel(context),
          ),
      ];

  static Widget topNavbar({
    @required BuildContext context,
    @required NavBarBloc navBarBloc,
    @required String appBarTitle,
    List<Widget> trailingActions,
  }) {
    return BlocBuilder(
      cubit: navBarBloc,
      builder: (context, state) {
        return DefaultTabController(
          length: navBarBloc.tabLenght,
          initialIndex: navBarBloc.initialIndex,
          child: PlatformScaffold(
            appBar: CustomAppBar(
              appBarType: AppBarType.back,
              title: appBarTitle,
              trailingActions:
                  trailingActions?.length == 0 ? null : trailingActions,
              bottom: TabBar(
                tabs: [
                  for (NavBarTab tab in navBarBloc.navBarTabs)
                    Tab(
                      text: tab.getLabel(context),
                    )
                ],
              ),
            ).getPlatformAppBar(context),
            body: TabBarView(children: navBarBloc.navBarTabs),
          ),
        );
      },
    );
  }
}
