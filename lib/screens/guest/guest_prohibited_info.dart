import 'package:engineering_thesis/components/custom_widgets/buttons/custom_button.dart';
import 'package:engineering_thesis/components/custom_widgets/text/cutom_text.dart';
import 'package:engineering_thesis/components/templates/center_screen.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/shared/routing.dart';
import 'package:engineering_thesis/shared/theme.dart';
import 'package:flutter/widgets.dart';

class GuestProhibitedInfo {
  static Widget getProhibitedInfo(BuildContext context, String infoText) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.screenPadding),
      child: CenterScreen(
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText.screenInfoHeader(infoText),
            SizedBox(
              height: Dimensions.gutterMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                goToLoginScreenButton(context),
                goToRegisterScreenButton(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget goToLoginScreenButton(BuildContext context) {
    return CustomButton.goToOtherScreen(
        text: S.of(context).guest_prohibited_go_to_login,
        onPressed: () => Routing.pushNamed(context, GuestRoutes.login));
  }

  static Widget goToRegisterScreenButton(context) {
    return CustomButton.goToOtherScreen(
        text: S.of(context).guest_prohibited_go_to_register,
        onPressed: () => Routing.pushNamed(context, GuestRoutes.register));
  }
}
