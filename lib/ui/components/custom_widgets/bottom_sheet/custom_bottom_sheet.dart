import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class CustomBottomSheet {
  static Future show(
      BuildContext context, Widget Function(BuildContext) builder) async {
    await showPlatformModalSheet(
        context: context,
        builder: (context) {
          return builder(context);
        });
  }
}
