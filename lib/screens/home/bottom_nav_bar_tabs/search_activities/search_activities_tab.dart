import 'package:engineering_thesis/blocs/abstract_blocs/send/send_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/authorization/user_data/user_data_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/home_screen/search_activities/search_activities_distance_send_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/home_screen/search_activities/search_activities_fetching_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/home_screen/search_activities/search_activities_search_filter_bloc.dart';
import 'package:engineering_thesis/components/abstract/nav_bar_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
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
      listener: (context, state) {
        if (state is SearchFilterSelectedOptionState) {
          BlocProvider.of<SearchActivitiesFetchingBloc>(context).add(
            FetchRefreshEvent(
              fetchArgs: SearchActivitiesFetchingArgsBloc(
                userRef: BlocProvider.of<UserDataBloc>(context).user.ref,
                location: (state.selectedOption as PlacesSearchResult)
                    .geometry
                    .location,
              ),
            ),
          );
        }
      },
      child: BlocListener(
        cubit: BlocProvider.of<SearchActivitiesDistanceSendBloc>(context),
        listener: (context, state) {
          if (state is SendDataSuccessState) {
            BlocProvider.of<SearchActivitiesFetchingBloc>(context).add(
              FetchRefreshEvent(
                fetchArgs: SearchActivitiesFetchingArgsBloc(
                  userRef: BlocProvider.of<UserDataBloc>(context).user.ref,
                  distanceKm:
                      BlocProvider.of<SearchActivitiesDistanceSendBloc>(context)
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
