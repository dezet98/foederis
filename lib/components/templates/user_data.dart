import 'package:engineering_thesis/components/custom_widgets/text/cutom_text.dart';
import 'package:engineering_thesis/models/app_user.dart';
import 'package:flutter/cupertino.dart';

class UserData extends StatelessWidget {
  final AppUser appUser;

  UserData({@required this.appUser});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSingleAttribute(context, 'email', appUser.email.toString()),
        _buildSingleAttribute(
            context, 'firstName', appUser.firstName.toString()),
        _buildSingleAttribute(
            context, 'secondName', appUser.secondName.toString()),
      ],
    );
  }

  Widget _buildSingleAttribute(context, String subtitle, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CustomText.menuTitle(
            subtitle,
            textAlign: TextAlign.left,
          ),
          CustomText.listItem(text),
        ],
      ),
    );
  }
}
