// import 'package:engineering_thesis/blocs/auth/auth_bloc.dart';
// import 'package:engineering_thesis/screens/home_screen.dart';
// import 'package:engineering_thesis/screens/register/splash_screen.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../routing.dart';
import 'package:engineering_thesis/shared/theme.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class TemplateScreen extends StatelessWidget {
  final Widget body;
  final PlatformAppBar platformAppBar;
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
      appBar: platformAppBar,
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

  // Widget protectBuildContent({@required Widget content}) {
  //   return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
  //     bool authenticated = BlocProvider.of<AuthBloc>(context).state
  //         is AuthUserAuthenticatedState;

  //     if (UserRoutes.props.contains(routeName)) {
  //       if (authenticated) return content;
  //       Navigator.pushNamedAndRemoveUntil(
  //           context, GuestRoutes.login, ModalRoute.withName(GuestRoutes.login));
  //       return SplashScreen(content: Text("You don\'t have permission"));
  //     } else if (GuestRoutes.props.contains(routeName)) {
  //       if (!authenticated) return content;
  //       return HomeScreen();
  //     }
  //   });
  // }
}
