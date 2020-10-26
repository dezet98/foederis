import 'package:engineering_thesis/blocs/auth/auth_bloc.dart';
import 'package:engineering_thesis/shared/routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool determined = false;

  @override
  Widget build(BuildContext context) {
    determine(context, BlocProvider.of<AuthBloc>(context).state);

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        determine(context, state);
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

  void determine(context, state) {
    Future.delayed(Duration(seconds: 1)).then((value) {
      if (state is AuthUserAuthenticatedState && !determined) {
        setState(() {
          determined = true;
        });
        Routing.pushReplacement(context, UserRoutes.home);
      } else if (state is AuthUserUnauthenticatedState && !determined) {
        setState(() {
          determined = true;
        });
        Routing.pushReplacement(context, GuestRoutes.login);
      }
    });
  }
}
