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
        _buildSingleAttribute('email', appUser.email.toString()),
        _buildSingleAttribute('firstName', appUser.firstName.toString()),
        _buildSingleAttribute('secondName', appUser.secondName.toString()),
      ],
    );
  }

  Widget _buildSingleAttribute(String subtitle, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CustomText(
            subtitle,
            textType: TextType.menu_title,
            alignment: Alignment.centerLeft,
          ),
          CustomText(text, textType: TextType.list_item),
        ],
      ),
    );
  }
}
