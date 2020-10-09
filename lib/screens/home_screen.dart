import 'package:engineering_thesis/shared/router.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RaisedButton(
            child: Text('login'),
            onPressed: () => Navigator.pushNamed(context, Routes.login),
          ),
            RaisedButton(
            child: Text('register'),
            onPressed: () => Navigator.pushNamed(context, Routes.register),
          ),
        ],
      ),
    );
  }
}
