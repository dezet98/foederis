import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class TemplateScreen extends StatelessWidget {
  final Widget body;
  final PlatformAppBar platformAppBar;

  TemplateScreen({this.body, this.platformAppBar});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: platformAppBar,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: body,
        ),
      ),
    );
  }
}
