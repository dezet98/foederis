import 'package:engineering_thesis/blocs/abstract_blocs/fetch/fetch_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/search_filter/search_filter_bloc.dart';
import 'package:engineering_thesis/blocs/search_activities/search_activities_filters_bloc.dart';
import 'package:engineering_thesis/blocs/search_activities/search_activities_search_filter_bloc.dart';
import 'package:engineering_thesis/blocs/search_activities/search_activities_fetching_bloc.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/screens/home/bottom_nav_bar_content/search_activities/search_activities_view.dart';
import 'package:engineering_thesis/screens/home/bottom_nav_bar_content/search_activities/search_activity_app_bar.dart';
import 'package:engineering_thesis/shared/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/shared/builders/fetching_bloc_builder.dart';
import 'package:engineering_thesis/shared/builders/filters/filtered_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SearchActivitiesScreen extends NavBarTab {
  @override
  Widget build(BuildContext context) {
    return BlocListener(
      cubit: BlocProvider.of<SearchActivitiesSearchFilterBloc>(context),
      listener: (context, state) {
        if (state is SearchFilterSelectedOptionState) {
          BlocProvider.of<SearchActivitiesFetchingBloc>(context).add(
            FetchInitialEvent(
              initialFilters: [
                BlocProvider.of<SearchActivitiesSearchFilterBloc>(context)
                    .getFetchFilter()
              ],
            ),
          );
        }
      },
      child: PlatformWidget(
        material: (_, __) => RefreshIndicator(
          displacement: 60.0,
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 2));
            BlocProvider.of<SearchActivitiesFetchingBloc>(context).add(
                FetchRefreshEvent(filters: [
              BlocProvider.of<SearchActivitiesSearchFilterBloc>(context)
                  .getFetchFilter()
            ]));
          },
          child: _buildCustomScrollView(context),
        ),
        cupertino: (_, __) => _buildCustomScrollView(context),
      ),
    );
  }

  Widget _buildCustomScrollView(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SearchActivitiesAppBar(),
        CupertinoSliverRefreshControl(
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 2));
            BlocProvider.of<SearchActivitiesFetchingBloc>(context).add(
                FetchRefreshEvent(filters: [
              BlocProvider.of<SearchActivitiesSearchFilterBloc>(context)
                  .getFetchFilter()
            ]));
          },
        ),
        FetchingBlocBuilder(
          fetchingCubit: BlocProvider.of<SearchActivitiesFetchingBloc>(context),
          buildSuccess: (activities) {
            return FilteredData<Activity>(
              data: activities,
              filtersBloc:
                  BlocProvider.of<SearchActivitiesFiltersBloc>(context),
              child: (context, activities) =>
                  SearchActivitiesView(activities: activities),
            );
          },
          buildError: SliverFillRemaining(
            child: Text('Error occur'),
          ),
          buildInProgress: SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          ),
        ),
      ],
    );
  }

  @override
  Icon getIcon(BuildContext context) => Icon(PlatformIcons(context).search);

  @override
  String getLabel(context) =>
      S.of(context).home_screen_search_activities_tab_name;
}
