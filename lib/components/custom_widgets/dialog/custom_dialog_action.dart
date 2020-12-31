import 'package:engineering_thesis/components/custom_widgets/buttons/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class CustomDialogAction extends StatelessWidget {
  final Function onPressed;
  final String buttonText;

  CustomDialogAction({@required this.buttonText, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return PlatformDialogAction(
      child: CustomButton.dialog(text: buttonText),
      onPressed: onPressed,
    );
  }
}
