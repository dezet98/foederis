import 'package:engineering_thesis/blocs/specific_blocs/authorization/user_data/user_data_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../blocs/specific_blocs/authorization/auth/auth_bloc.dart';
import '../../shared/routing/routing.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _determined = false;

  @override
  Widget build(BuildContext context) {
    _determine(context, BlocProvider.of<AuthBloc>(context).state,
        BlocProvider.of<UserDataBloc>(context).state);

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        _determine(
            context, state, BlocProvider.of<UserDataBloc>(context).state);
      },
      child: PlatformScaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PlatformCircularProgressIndicator(),
              SizedBox(height: 4.0),
              Text('Check user'),
            ],
          ),
        ),
      ),
    );
  }

  // todo add loading data
  void _determine(context, AuthState authState, UserDataState dataState) {
    Future.delayed(Duration(seconds: 1)).then((value) {
      if (authState is AuthUserAuthenticatedState && !_determined) {
        setState(() {
          _determined = true;
        });
        Routing.pushReplacement(context, UserRoutes.home);
      } else if (authState is AuthUserUnauthenticatedState && !_determined) {
        setState(() {
          _determined = true;
        });
        Routing.pushReplacement(context, GuestRoutes.login);
      }
    });
  }
}
