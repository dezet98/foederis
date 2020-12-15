import 'package:engineering_thesis/shared/components/card/custom_card.dart';
import 'package:engineering_thesis/shared/routing.dart';
import 'package:flutter/material.dart';
import 'package:engineering_thesis/blocs/search_activities/search_activities_filters_bloc.dart';
import 'package:engineering_thesis/blocs/search_activities/search_activities_fetching_bloc.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/screens/home/bottom_nav_bar_content/search_activities/search_activity_app_bar.dart';
import 'package:engineering_thesis/shared/builders/fetching_bloc_builder.dart';
import 'package:engineering_thesis/shared/builders/filters/filtered_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

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
        buildActivities(context),
      ],
    );
  }

  Widget buildActivities(BuildContext context) {
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
      buildError: SliverFillRemaining(
        child: Text('Error occur'),
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
            options: activity);
      },
    );
  }
}
