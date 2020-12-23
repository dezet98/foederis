import 'package:engineering_thesis/blocs/abstract_blocs/fetch/fetch_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/form_data/form_data/form_data_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/search_filter/search_filter_bloc.dart';
import 'package:engineering_thesis/blocs/search_activities/search_activities_distance_choice_bloc.dart';
import 'package:engineering_thesis/blocs/search_activities/search_activities_search_filter_bloc.dart';
import 'package:engineering_thesis/blocs/search_activities/search_activities_fetching_bloc.dart';
import 'package:engineering_thesis/blocs/shared_preferences/shared_preferences_bloc.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/screens/home/bottom_nav_bar_content/search_activities/search_activities_list_view.dart';
import 'package:engineering_thesis/screens/home/bottom_nav_bar_content/search_activities/search_activities_map_view.dart';
import 'package:engineering_thesis/shared/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/shared/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:google_maps_webservice/places.dart';

class SearchActivitiesScreen extends NavBarTab {
  @override
  Widget build(BuildContext context) {
    return BlocListener(
      cubit: BlocProvider.of<SearchActivitiesSearchFilterBloc>(context),
      listener: (context, state) {
        if (state is SearchFilterSelectedOptionState) {
          BlocProvider.of<SearchActivitiesFetchingBloc>(context).add(
            FetchRefreshEvent(
              filters: SearchActivitiesFetchingBloc.getFetchFilters(
                location: (state.selectedOption as PlacesSearchResult)
                    .geometry
                    .location,
              ),
            ),
          );
        }
      },
      child: BlocListener(
        cubit: BlocProvider.of<SearchActivityDistanceChoiceBloc>(context),
        listener: (context, state) {
          if (state is FormDataUploadSuccessState) {
            BlocProvider.of<SearchActivitiesFetchingBloc>(context).add(
              FetchRefreshEvent(
                filters: SearchActivitiesFetchingBloc.getFetchFilters(
                  distanceKm:
                      BlocProvider.of<SearchActivityDistanceChoiceBloc>(context)
                          .distance,
                ),
              ),
            );
          }
        },
        child: BlocBuilder(
          cubit: BlocProvider.of<SearchActivitiesFetchingBloc>(context),
          builder: (context, state) {
            return _buildView(context);
          },
        ),
      ),
    );
  }

  Widget _buildView(BuildContext context) {
    return BlocBuilder(
      cubit: BlocProvider.of<SharedPreferencesBloc>(context),
      builder: (context, state) {
        if (SharedPreferences().searchActivityView ==
            SharedPreferencesSearchActivityCode.list)
          return SearchActivitiesListView(onRefresh: onRefresh);
        else
          return SearchActivityMapView(onRefresh: onRefresh);
      },
    );
  }

  onRefresh(BuildContext context) async {
    await Future.delayed(Duration(seconds: 2));
    BlocProvider.of<SearchActivitiesFetchingBloc>(context).add(
      FetchRefreshEvent(),
    );
  }

  @override
  Icon getIcon(BuildContext context) => Icon(PlatformIcons(context).search);

  @override
  String getLabel(context) =>
      S.of(context).home_screen_search_activities_tab_name;
}

class BlocCustomer {}
