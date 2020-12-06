import 'package:engineering_thesis/shared/components/buttons/custom_button.dart';
import 'package:engineering_thesis/shared/components/text/cutom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import '../../routing.dart';

enum AppBarType {
  back,
  close,
}

class CustomAppBar extends StatelessWidget {
  final AppBarType appBarType;
  final String title;
  final Function() onPressed;

  CustomAppBar({this.appBarType = AppBarType.back, this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return getdPlatformAppBar(context);
  }

  PlatformAppBar getdPlatformAppBar(BuildContext context) {
    return PlatformAppBar(
      title: CustomText(title, textType: TextType.page_title),
      leading: _buildAppBarLeading(context),
    );
  }

  Widget _buildAppBarLeading(BuildContext context) {
    switch (appBarType) {
      case AppBarType.back:
        return CustomButton(
          buttonType: ButtonType.icon_button,
          materialIconData: Icons.arrow_back,
          cupertinoIconData: Icons.arrow_back_ios,
          onPressed: onPressed ?? () => Routing.pop(context),
        );
        break;
      case AppBarType.close:
        return CustomButton(
          buttonType: ButtonType.icon_button,
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
