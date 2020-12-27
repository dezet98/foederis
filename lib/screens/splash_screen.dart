import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../blocs/specific_blocs/authorization/auth/auth_bloc.dart';
import '../shared/routing.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _determined = false;

  @override
  Widget build(BuildContext context) {
    _determine(context, BlocProvider.of<AuthBloc>(context).state);

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        _determine(context, state);
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
  void _determine(context, state) {
    Future.delayed(Duration(seconds: 1)).then((value) {
      if (state is AuthUserAuthenticatedState && !_determined) {
        setState(() {
          _determined = true;
        });
        Routing.pushReplacement(context, UserRoutes.home);
      } else if (state is AuthUserUnauthenticatedState && !_determined) {
        setState(() {
          _determined = true;
        });
        Routing.pushReplacement(context, GuestRoutes.login);
      }
    });
  }
}
