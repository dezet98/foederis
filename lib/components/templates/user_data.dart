import 'package:engineering_thesis/components/custom_widgets/avatar/custom_user_avatar.dart';
import 'package:engineering_thesis/components/custom_widgets/text/cutom_text.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/models/app_user.dart';
import 'package:engineering_thesis/shared/view/theme.dart';
import 'package:flutter/cupertino.dart';

class UserData extends StatelessWidget {
  final AppUser appUser;
  final bool withContactInfo;

  UserData({@required this.appUser, this.withContactInfo = false});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Stack(children: [
          Column(
            children: [
              SizedBox(height: Dimensions.screenPadding),
              CustomUserAvatar.fromUrl(context, appUser.photoUrl,
                  diameter: MediaQuery.of(context).size.width / 3),
              if (withContactInfo)
                _buildSingleAttribute(
                    context,
                    S.of(context).user_profile_screen_basic_info_email_label,
                    appUser.email),
              if (appUser.firstName != null)
                _buildSingleAttribute(
                    context,
                    S.of(context).user_profile_screen_basic_info_first_name,
                    appUser.firstName),
              if (appUser.secondName != null)
                _buildSingleAttribute(
                    context,
                    S.of(context).user_profile_screen_basic_info_second_name,
                    appUser.secondName),
              if (appUser.about != null)
                _buildSingleAttribute(
                    context,
                    S.of(context).user_profile_screen_basic_info_about,
                    appUser.about),
              if (appUser.gender != null)
                _buildSingleAttribute(
                    context,
                    S.of(context).user_profile_screen_basic_info_gender,
                    AppUser.genderAsString(context, appUser.gender)),
              if (appUser.birthday != null)
                _buildSingleAttribute(
                    context,
                    S.of(context).user_profile_screen_basic_info_age,
                    appUser.age.toString()),
              if (appUser.phone != null && withContactInfo)
                _buildSingleAttribute(
                    context,
                    S.of(context).user_profile_screen_basic_info_phone,
                    appUser.phone),
            ],
          ),
        ]),
      ),
    );
  }

  Widget _buildSingleAttribute(context, String subtitle, String text) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.screenPadding),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: CustomText.menuTitle(subtitle, textAlign: TextAlign.left),
          ),
          CustomText.listItem(text),
        ],
      ),
    );
  }
}
