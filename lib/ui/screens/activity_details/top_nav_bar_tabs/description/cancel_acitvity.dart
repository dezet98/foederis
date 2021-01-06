import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/ui/components/custom_widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';

class CancelActivityButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomButton.applyForm(
      text: S.of(context).activity_details_screen_cancel_activity_button_text,
    );
  }
}
