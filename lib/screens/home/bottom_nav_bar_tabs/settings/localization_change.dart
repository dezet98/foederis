import 'package:engineering_thesis/blocs/abstract_blocs/nav_bar/nav_bar_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/home_screen/home_screen_bottom_nav_bar_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/shared_preferences/shared_preferences_bloc.dart';
import 'package:engineering_thesis/components/custom_widgets/dropdown/custom_dropdown_button.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/shared/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalizationChange extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      cubit: BlocProvider.of<SharedPreferencesBloc>(context),
      listener: (context, state) {
        if (state is SharedPreferenceLocalizationChangeSuccessState) {
          S.load(Locale(state.locale.languageCode, state.locale.countryCode));
          BlocProvider.of<HomeScreenBottomNavBarBloc>(context)
              .add(NavBarRefreshEvent());
        }
      },
      builder: (context, state) {
        return CustomDropdownButton<Locale>(
          value: Locale(SharedPreferences().languageCode,
              SharedPreferences().countryCode),
          dropdownItems: [
            for (Locale locale in S.delegate.supportedLocales) locale,
          ],
          getItemLabel: (context, Locale locale) =>
              toLabel(context, locale.languageCode),
          onChanged: (Locale locale) {
            BlocProvider.of<SharedPreferencesBloc>(context)
                .add(SharedPreferencesLocalizationChangeEvent(locale: locale));
          },
        );
      },
    );
  }

  String toLabel(BuildContext context, String languageCode) {
    switch (languageCode) {
      case 'en':
        return S.of(context).localization_en_US;
        break;
      case 'pl':
        return S.of(context).localization_pl_PL;
        break;
    }

    return '';
  }
}
