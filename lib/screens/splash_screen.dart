import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SplashScreen extends StatelessWidget {
  final Widget content;

  SplashScreen({this.content});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: Center(
        child: content ?? Text("No routes"),
      ),
    );
  }
}
