import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/shared/components/buttons/custom_button.dart';
import 'package:engineering_thesis/shared/routing.dart';
import 'package:engineering_thesis/shared/templates/template_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ActivityDetailsScreen extends StatelessWidget {
  final Activity activity;

  ActivityDetailsScreen({@required this.activity});

  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      platformAppBar: PlatformAppBar(
        title: Text(activity.title),
        leading: CustomButton(
          buttonType: ButtonType.icon_button,
          materialIconData: Icons.close,
          cupertinoIconData: CupertinoIcons.return_icon,
          onPressed: () => Routing.pop(context),
        ),
      ),
      body: Center(
        child: Text('Activity Details'),
      ),
    );
  }
}
