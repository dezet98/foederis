import 'package:engineering_thesis/blocs/abstract_blocs/nav_bar/nav_bar_bloc.dart';
import 'package:engineering_thesis/components/abstract/nav_bar_tab.dart';
import 'package:meta/meta.dart';

class ActivityDetailsTopNavbarBloc extends NavBarBloc {
  final List<NavBarTab> navBarTabs;
  int initialIndex;

  ActivityDetailsTopNavbarBloc({
    @required this.navBarTabs,
    this.initialIndex = 0,
  });
}
