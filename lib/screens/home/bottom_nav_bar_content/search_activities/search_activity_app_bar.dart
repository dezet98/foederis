import 'package:engineering_thesis/blocs/search_activities/search_activities_filters_bloc.dart';
import 'package:engineering_thesis/blocs/search_activities/search_activities_search_filter_bloc.dart';
import 'package:engineering_thesis/blocs/shared_preferences/shared_preferences_bloc.dart';
import 'package:engineering_thesis/models/shared_preferences.dart';
import 'package:engineering_thesis/shared/components/buttons/custom_button.dart';
import 'package:engineering_thesis/shared/routing.dart';
import 'package:engineering_thesis/shared/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchActivitiesAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: BlocBuilder(
        cubit: BlocProvider.of<SearchActivitiesSearchFilterBloc>(context),
        builder: (context, state) {
          return Text(
            BlocProvider.of<SearchActivitiesSearchFilterBloc>(context)
                        .selectedOption !=
                    null
                ? BlocProvider.of<SearchActivitiesSearchFilterBloc>(context)
                    .display(BlocProvider.of<SearchActivitiesSearchFilterBloc>(
                            context)
                        .selectedOption)
                : 'Choose City',
          );
        },
      ),
      elevation: 4,
      actions: [
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              await SearchScreen.show(context,
                  BlocProvider.of<SearchActivitiesSearchFilterBloc>(context));
            }),
        _buildChangingViewButton(context),
        CustomButton(
          buttonType: ButtonType.icon_button,
          cupertinoIconData: CupertinoIcons.color_filter,
          materialIconData: Icons.filter_list,
          onPressed: () {
            Routing.pushNamed(
              context,
              CommonRoutes.filter,
              options: BlocProvider.of<SearchActivitiesFiltersBloc>(context),
            );
          },
        )
      ],
    );
  }

  Widget _buildChangingViewButton(BuildContext context) {
    String searchActivityView = BlocProvider.of<SharedPreferencesBloc>(context)
        .sharedPreferences
        .searchActivityView;

    return BlocConsumer(
      cubit: BlocProvider.of<SharedPreferencesBloc>(context),
      listener: (context, state) {
        searchActivityView = BlocProvider.of<SharedPreferencesBloc>(context)
            .sharedPreferences
            .searchActivityView;
      },
      builder: (context, state) {
        return CustomButton(
          buttonType: ButtonType.icon_button,
          materialIconData: searchActivityView == SharedPreferencesCode.list
              ? Icons.map
              : Icons.list,
          onPressed: () => {
            if (searchActivityView == SharedPreferencesCode.list)
              BlocProvider.of<SharedPreferencesBloc>(context).add(
                SharedPreferencesUpdateEvent(
                  SharedPreferencesName.searchActivityName,
                  SharedPreferencesCode.map,
                ),
              )
            else if (searchActivityView == SharedPreferencesCode.map)
              BlocProvider.of<SharedPreferencesBloc>(context).add(
                SharedPreferencesUpdateEvent(
                  SharedPreferencesName.searchActivityName,
                  SharedPreferencesCode.list,
                ),
              )
          },
        );
      },
    );
  }
}
