import 'package:engineering_thesis/blocs/abstract_blocs/nav_bar/nav_bar_bloc.dart';
import 'package:engineering_thesis/components/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/models/app_user.dart';
import 'package:engineering_thesis/screens/profile/top_nav_bar_tabs/user_data/user_data_tab.dart';
import 'package:meta/meta.dart';

class ProfileScreenTopNavbarBloc extends NavBarBloc {
  final int initialIndex;
  final AppUser appUser;

  ProfileScreenTopNavbarBloc({
    this.initialIndex = 0,
    @required this.appUser,
  });

  List<NavBarTab> get navBarTabs {
    return [
      UserDataTab(
        appUser: appUser,
      )
    ];
  }
}
