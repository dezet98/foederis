import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/shared/components/app_bars/custom_app_bar.dart';
import 'package:engineering_thesis/shared/templates/template_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ActivityDetailsScreen extends StatelessWidget {
  final Activity activity;

  ActivityDetailsScreen({@required this.activity});

  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      platformAppBar: CustomAppBar(
        appBarType: AppBarType.back,
        title: activity.title,
      ),
      body: Center(
        child: Text('Activity Details'),
      ),
    );
  }
}
