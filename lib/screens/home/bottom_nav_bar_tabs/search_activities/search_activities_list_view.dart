import 'package:engineering_thesis/blocs/specific_blocs/home_screen/search_activities/search_activities_fetching_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/home_screen/search_activities/search_activities_filters_bloc.dart';
import 'package:engineering_thesis/components/bloc_builders/cards/activity_card.dart';
import 'package:engineering_thesis/components/bloc_builders/fetching_bloc_builder.dart';
import 'package:engineering_thesis/components/bloc_builders/filters/filtered_data.dart';
import 'package:engineering_thesis/components/custom_widgets/refresh_indicator/custom_refresh_indicator.dart';
import 'package:engineering_thesis/shared/exceptions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../../models/activity.dart';
import 'search_activity_app_bar.dart';

class SearchActivitiesListView extends StatelessWidget {
  final Function(BuildContext) onRefresh;

  SearchActivitiesListView({@required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      material: (_, __) => CustomRefreshIndicator(
        displacement: 60.0,
        onRefresh: () => onRefresh(context),
        child: _buildCustomScrollView(context),
      ),
      cupertino: (_, __) => _buildCustomScrollView(context),
    );
  }

  Widget _buildCustomScrollView(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SearchActivitiesAppBar.getSliverAppBar(context),
        CustomRefreshIndicator.cupertinoRefreshIndicator(
            () => onRefresh(context)),
        _fetchActivities(context),
      ],
    );
  }

  Widget _fetchActivities(BuildContext context) {
    return FetchingBlocBuilder(
      fetchingCubit: BlocProvider.of<SearchActivitiesFetchingBloc>(context),
      buildSuccess: (activities) {
        return FilteredData<Activity>(
          data: activities,
          filtersBloc: BlocProvider.of<SearchActivitiesFiltersBloc>(context),
          child: (context, activities) =>
              _buildActivitiesList(context, activities),
        );
      },
      buildError: (error) => SliverFillRemaining(
        child: Text(error is FetchingException
            ? '${error.message}'
            : 'Error occur: ${error.toString()}'),
      ),
      buildInProgress: SliverFillRemaining(
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget _buildActivitiesList(BuildContext context, List<Activity> activities) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          for (Activity activity in activities)
            buildActivityTile(context, activity)
        ],
      ),
    );
  }

  Widget buildActivityTile(BuildContext context, Activity activity) {
    return ActivityCard(
      activity: activity,
    );
  }
}
