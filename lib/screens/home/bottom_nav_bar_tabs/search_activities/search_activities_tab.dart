import 'package:engineering_thesis/blocs/abstract_blocs/send/send_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/home_screen/search_activities/search_activities_distance_send_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/home_screen/search_activities/search_activities_fetching_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/home_screen/search_activities/search_activities_search_filter_bloc.dart';
import 'package:engineering_thesis/components/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/components/custom_widgets/icon/custom_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_webservice/places.dart';

import '../../../../blocs/abstract_blocs/fetch/fetch_bloc.dart';
import '../../../../blocs/abstract_blocs/search_filter/search_filter_bloc.dart';
import '../../../../blocs/specific_blocs/shared_preferences/shared_preferences_bloc.dart';
import '../../../../generated/l10n.dart';
import '../../../../shared/shared_preferences.dart';
import 'search_activities_list_view.dart';
import 'search_activities_map_view.dart';

class SearchActivitiesTab extends NavBarTab {
  @override
  Widget build(BuildContext context) {
    return BlocListener(
      cubit: BlocProvider.of<SearchActivitiesSearchFilterBloc>(context),
      listener: _searchActivitiesSearchFilterBlocListener,
      child: BlocListener(
        cubit: BlocProvider.of<SearchActivitiesDistanceSendBloc>(context),
        listener: _searchActivitiesDistanceSendBlocListener,
        child: BlocBuilder(
          cubit: BlocProvider.of<SearchActivitiesFetchingBloc>(context),
          builder: (context, state) => _buildView(context),
        ),
      ),
    );
  }

  /// depends on user preferences choose list or map activities view
  Widget _buildView(BuildContext context) {
    return BlocBuilder(
      cubit: BlocProvider.of<SharedPreferencesBloc>(context),
      builder: (context, state) {
        if (SharedPreferences().searchActivityView ==
            SharedPreferencesSearchActivityCode.list)
          return SearchActivitiesListView(onRefresh: _onRefreshActivities);
        else
          return SearchActivityMapView(onRefresh: _onRefreshActivities);
      },
    );
  }

  void _onRefreshActivities(BuildContext context) async {
    await Future.delayed(Duration(seconds: 2));
    BlocProvider.of<SearchActivitiesFetchingBloc>(context).add(
      FetchRefreshEvent(),
    );
  }

  /// if address changed call to refresh activities
  void _searchActivitiesSearchFilterBlocListener(context, state) {
    if (state is SearchFilterSelectedOptionState) {
      BlocProvider.of<SearchActivitiesFetchingBloc>(context).add(
        FetchRefreshEvent(
          fetchArgs: SearchActivitiesFetchingArgsBloc(
            location:
                (state.selectedOption as PlacesSearchResult).geometry.location,
          ),
        ),
      );
    }
  }

  /// if search area changed call to refresh activities
  void _searchActivitiesDistanceSendBlocListener(context, state) {
    if (state is SendDataSuccessState) {
      BlocProvider.of<SearchActivitiesFetchingBloc>(context).add(
        FetchRefreshEvent(
          fetchArgs: SearchActivitiesFetchingArgsBloc(
            distanceKm:
                BlocProvider.of<SearchActivitiesDistanceSendBloc>(context)
                    .distance,
          ),
        ),
      );
    }
  }

  @override
  Widget getIcon(BuildContext context) => CustomIcon.searchActivityBottomTab;

  @override
  String getLabel(context) =>
      S.of(context).home_screen_search_activities_tab_name;
}
