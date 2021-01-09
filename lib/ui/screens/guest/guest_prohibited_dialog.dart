import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/shared/routing/routing.dart';
import 'package:engineering_thesis/ui/components/custom_widgets/dialog/custom_dialog_action.dart';
import 'package:engineering_thesis/ui/components/custom_widgets/dialog/custom_modal.dart';
import 'package:engineering_thesis/ui/components/custom_widgets/text/cutom_text.dart';

class GuestProhibitedDialog {
  static showDialog(context) {
    CustomDialog.showModal(context,
        content:
            CustomText.modalText(S.of(context).guest_prohibited_access_info),
        title: S.of(context).guest_prohibited_access_title,
        actions: [
          CustomDialogAction(
              buttonText: S.of(context).guest_prohibited_go_to_login,
              onPressed: () => _navigateToLoginScreen(context)),
          CustomDialogAction(
              buttonText: S.of(context).guest_prohibited_go_to_register,
              onPressed: () => _navigateToRegisterScreen(context))
        ]);
  }

  static void _navigateToRegisterScreen(context) {
    Routing.pushNamed(context, GuestRoutes.register);
  }

  static void _navigateToLoginScreen(context) {
    Routing.pushNamed(context, GuestRoutes.login);
  }
}
