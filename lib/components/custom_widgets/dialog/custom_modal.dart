import 'package:engineering_thesis/components/custom_widgets/dialog/custom_dialog_action.dart';
import 'package:engineering_thesis/components/custom_widgets/text/cutom_text.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/shared/routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class CustomDialog {
  static Future<void> showModal(
    BuildContext context, {
    @required String title,
    @required Widget content,
    List<CustomDialogAction> actions,
    bool okButton = false,
  }) async {
    if (okButton) {
      actions.add(CustomDialogAction(
          buttonText: S.of(context).dialog_ok,
          onPressed: () {
            Routing.pop(context);
          }));
    }
    await showPlatformDialog(
      context: context,
      builder: (_) => PlatformAlertDialog(
        title: CustomText.menuTitle(title),
        content: content,
        actions: actions,
      ),
    );
  }
}
