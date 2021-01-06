import 'package:engineering_thesis/blocs/specific_blocs/home_screen/search_activities/search_activities_distance_choice_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/home_screen/search_activities/search_activities_distance_send_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/home_screen/search_activities/search_activities_filters_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/home_screen/search_activities/search_activities_search_filter_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/shared_preferences/shared_preferences_bloc.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/shared/local_database/shared_preferences.dart';
import 'package:engineering_thesis/shared/routing/routing.dart';
import 'package:engineering_thesis/ui/components/bloc_builders/search_screen.dart';
import 'package:engineering_thesis/ui/components/custom_widgets/buttons/custom_button.dart';
import 'package:engineering_thesis/ui/components/custom_widgets/gesture_detector/custom_gesture_detector.dart';
import 'package:engineering_thesis/ui/components/custom_widgets/icon/custom_icon.dart';
import 'package:engineering_thesis/ui/components/custom_widgets/text/cutom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchActivitiesAppBar {
  static SliverAppBar getSliverAppBar(BuildContext context) => SliverAppBar(
        title: _buildAddressField(context),
        elevation: 4,
        actions: _buildAction(context),
      );

  static AppBar getAppBar(BuildContext context) => AppBar(
        title: _buildAddressField(context),
        elevation: 4,
        actions: _buildAction(context),
      );

  static Widget _buildAddressField(BuildContext context) {
    return BlocBuilder(
      cubit: BlocProvider.of<SharedPreferencesBloc>(context),
      builder: (context, state) {
        return CustomGestureDetector(
          onTap: () async {
            await SearchScreen.show(context,
                BlocProvider.of<SearchActivitiesSearchFilterBloc>(context));
          },
          child: CustomText.pageTitle(
            SharedPreferences().address ??
                S
                    .of(context)
                    .home_screen_search_activities_address_field_placeholder,
          ),
        );
      },
    );
  }

  static List<Widget> _buildAction(BuildContext context) {
    return [
      _buildDistanceButton(context),
      _buildChangingViewButton(context),
      _buildFilterButton(context),
    ];
  }

  static Widget _buildDistanceButton(BuildContext context) {
    return BlocBuilder(
      cubit: BlocProvider.of<SharedPreferencesBloc>(context),
      builder: (context, state) {
        return BlocBuilder(
          cubit: BlocProvider.of<SearchActivitiesSearchFilterBloc>(context),
          builder: (context, state) {
            return BlocProvider<SearchActivityDistanceChoiceBloc>(
              create: (context) => SearchActivityDistanceChoiceBloc(),
              child: Builder(
                builder: (context) {
                  return CustomButton.iconWithTextButton(
                    text: S
                        .of(context)
                        .kilometres_short(SharedPreferences().distanceKm),
                    customIcon: CustomIcon.distancePicker,
                    onPressed: () {
                      Routing.pushNamed(
                        context,
                        UserRoutes.form,
                        options: {
                          RoutingOption.formDataBloc:
                              BlocProvider.of<SearchActivityDistanceChoiceBloc>(
                                  context),
                          RoutingOption.formAppBarTitle:
                              S.of(context).search_area_form_nav_bar_title,
                          RoutingOption.formNextButtonText:
                              S.of(context).search_area_form_apply_text,
                          RoutingOption.sendBloc:
                              BlocProvider.of<SearchActivitiesDistanceSendBloc>(
                                  context),
                          RoutingOption.afterSuccess: () {
                            Routing.pop(context);
                          }
                        },
                      );
                    },
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  static Widget _buildFilterButton(BuildContext context) {
    return CustomButton.iconButton(
      customIcon: CustomIcon.filter,
      onPressed: () {
        Routing.pushNamed(
          context,
          CommonRoutes.filter,
          options: {
            RoutingOption.filtersBloc:
                BlocProvider.of<SearchActivitiesFiltersBloc>(context)
          },
        );
      },
    );
  }

  static Widget _buildChangingViewButton(BuildContext context) {
    return BlocBuilder(
      cubit: BlocProvider.of<SharedPreferencesBloc>(context),
      builder: (context, state) {
        return CustomButton.iconButton(
          customIcon: SharedPreferences().searchActivityView ==
                  SharedPreferencesSearchActivityCode.list
              ? CustomIcon.list
              : CustomIcon.map,
          onPressed: () => {
            if (SharedPreferences().searchActivityView ==
                SharedPreferencesSearchActivityCode.list)
              BlocProvider.of<SharedPreferencesBloc>(context).add(
                SharedPreferencesUpdateEvent(
                  SharedPreferencesName.searchActivityName,
                  SharedPreferencesSearchActivityCode.map,
                ),
              )
            else if (SharedPreferences().searchActivityView ==
                SharedPreferencesSearchActivityCode.map)
              BlocProvider.of<SharedPreferencesBloc>(context).add(
                SharedPreferencesUpdateEvent(
                  SharedPreferencesName.searchActivityName,
                  SharedPreferencesSearchActivityCode.list,
                ),
              )
          },
        );
      },
    );
  }
}
