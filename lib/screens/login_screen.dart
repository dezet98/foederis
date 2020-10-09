import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/shared/components/template_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: Text(S.of(context).login),
          ),
        ],
      ),
    );
  }
}
