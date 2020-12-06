import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/shared/components/app_bars/custom_app_bar.dart';
import 'package:engineering_thesis/shared/templates/template_screen.dart';
import 'package:flutter/widgets.dart';

class CreateActivityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      platformAppBar: _buildAppBar(context),
      body: Center(
        child: Text('hello'),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      appBarType: AppBarType.close,
      title: S.of(context).create_activity_screen_nav_title,
    );
  }
}
