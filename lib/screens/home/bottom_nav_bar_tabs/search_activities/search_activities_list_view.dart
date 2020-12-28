import 'package:engineering_thesis/components/bloc_builders/fetching_bloc_builder.dart';
import 'package:engineering_thesis/components/bloc_builders/filters/filtered_data.dart';
import 'package:engineering_thesis/components/custom_widgets/card/custom_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../../blocs/specific_blocs/search_activities/search_activities_fetching_bloc.dart';
import '../../../../blocs/specific_blocs/search_activities/search_activities_filters_bloc.dart';
import '../../../../models/activity.dart';
import '../../../../shared/routing.dart';
import 'search_activity_app_bar.dart';

class SearchActivitiesListView extends StatelessWidget {
  final Function(BuildContext) onRefresh;

  SearchActivitiesListView({@required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      material: (_, __) => RefreshIndicator(
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
        CupertinoSliverRefreshControl(
          onRefresh: () => onRefresh(context),
        ),
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
              buildActivitiesList(context, activities),
        );
      },
      buildError: (error) => SliverFillRemaining(
        child: Text('Error occur: ${error.toString()}'),
      ),
      buildInProgress: SliverFillRemaining(
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget buildActivitiesList(BuildContext context, List<Activity> activities) {
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
    return CustomCard(
      title: activity.title,
      subtitle: activity.categoryRef.toString(),
      onTap: () {
        Routing.pushNamed(context, UserRoutes.activityDetails,
            options: {RoutingOption.activity: activity});
      },
    );
  }
}
