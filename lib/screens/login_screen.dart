import 'package:engineering_thesis/blocs/login/login_bloc.dart';
import 'package:engineering_thesis/repositories/auth_repository.dart';
import 'package:engineering_thesis/shared/templates/template_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      platformAppBar: PlatformAppBar(
        title: Text("Login"),
      ),
      body: Column(
        children: [
          TextFormField(),
          TextFormField(),
          RaisedButton(
            onPressed: () {
              RepositoryProvider.of<AuthRepository>(context).signAnon();
            },
            child: Text('log in anon'),
          ),
          RaisedButton(
              onPressed: () {
                BlocProvider.of<LoginBloc>(context).add(
                  LoginWithEmailAndPasswordEvent(
                      email: 'd@g.com', password: '123456aa'),
                );
              },
              child: Text('log in with credentials'))
        ],
      ),
    );
  }
}
