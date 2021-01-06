import 'package:engineering_thesis/shared/routing/routing.dart';
import 'package:engineering_thesis/ui/components/custom_widgets/buttons/custom_button.dart';
import 'package:engineering_thesis/ui/components/custom_widgets/icon/custom_icon.dart';
import 'package:engineering_thesis/ui/components/custom_widgets/text/cutom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class CustomAppBar extends StatelessWidget {
  final Widget customIcon;
  final String title;
  final Function() onPressed;
  final TabBar bottom;
  final List<Widget> trailingActions;

  CustomAppBar({
    this.customIcon,
    this.title,
    this.onPressed,
    this.bottom,
    this.trailingActions,
  });

  @override
  Widget build(BuildContext context) {
    return getPlatformAppBar(context);
  }

  PlatformAppBar getPlatformAppBar(BuildContext context) {
    return PlatformAppBar(
      title: CustomText.pageTitle(title),
      leading: CustomButton.iconButton(
        customIcon: customIcon == null ? CustomIcon.back : customIcon,
        onPressed: onPressed ?? () => Routing.pop(context),
      ),
      trailingActions: trailingActions,
      material: (context, platform) => MaterialAppBarData(bottom: bottom),
    );
  }
}
