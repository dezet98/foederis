import 'package:engineering_thesis/components/custom_widgets/buttons/custom_button.dart';
import 'package:engineering_thesis/components/custom_widgets/text/cutom_text.dart';
import 'package:engineering_thesis/shared/routing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

enum AppBarType {
  back,
  close,
}

class CustomAppBar extends StatelessWidget {
  final AppBarType appBarType;
  final String title;
  final Function() onPressed;
  final TabBar bottom;

  CustomAppBar(
      {this.appBarType = AppBarType.back,
      this.title,
      this.onPressed,
      this.bottom});

  @override
  Widget build(BuildContext context) {
    return getPlatformAppBar(context);
  }

  PlatformAppBar getPlatformAppBar(BuildContext context) {
    return PlatformAppBar(
      title: CustomText(title, textType: TextType.page_title),
      leading: _buildAppBarLeading(context),
      material: (context, platform) => MaterialAppBarData(bottom: bottom),
    );
  }

  Widget _buildAppBarLeading(BuildContext context) {
    switch (appBarType) {
      case AppBarType.back:
        return CustomButton.iconButton(
          materialIconData: Icons.arrow_back,
          cupertinoIconData: Icons.arrow_back_ios,
          onPressed: onPressed ?? () => Routing.pop(context),
        );
        break;
      case AppBarType.close:
        return CustomButton.iconButton(
          materialIconData: Icons.close,
          cupertinoIconData: CupertinoIcons.return_icon,
          onPressed: onPressed ?? () => Routing.pop(context),
        );
        break;
    }
    assert(false, 'AppBarType not provider');
    return Container();
  }
}