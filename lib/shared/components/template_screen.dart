import 'package:flutter/material.dart';

class TemplateScreen extends StatelessWidget {
  final Widget body;
  final Widget appBar;

  TemplateScreen({this.body, this.appBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
              child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: body,
        ),
      ),
    );
  }
}
