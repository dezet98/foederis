import 'package:engineering_thesis/blocs/specific_blocs/home_screen/search_activities/search_activities_fetching_bloc.dart';
import 'package:engineering_thesis/blocs/specific_blocs/home_screen/search_activities/search_activities_filters_bloc.dart';
import 'package:engineering_thesis/data/models/activity.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/shared/view/theme.dart';
import 'package:engineering_thesis/ui/components/bloc_builders/cards/activity_card.dart';
import 'package:engineering_thesis/ui/components/bloc_builders/fetching_bloc_builder.dart';
import 'package:engineering_thesis/ui/components/bloc_builders/filters/filtered_data.dart';
import 'package:engineering_thesis/ui/components/custom_widgets/refresh_indicator/custom_refresh_indicator.dart';
import 'package:engineering_thesis/ui/components/custom_widgets/text/cutom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'search_activity_app_bar.dart';

class SearchActivitiesListView extends StatelessWidget {
  final Function(BuildContext) onRefresh;

  SearchActivitiesListView({@required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      material: (_, __) => CustomRefreshIndicator(
        displacement: Dimensions.refreshDisplacement,
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
        _fetchandFilterActivities(context),
      ],
    );
  }

  Widget _fetchandFilterActivities(BuildContext context) {
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
      buildError: (_) => _buildError(context),
      buildInProgress: _buildInProgress(),
    );
  }

  Widget _buildActivitiesList(BuildContext context, List<Activity> activities) {
    return activities.length == 0
        ? _buildNoResults(context)
        : SliverList(
            delegate: SliverChildListDelegate(
              [
                for (Activity activity in activities)
                  _buildActivityTile(context, activity)
              ],
            ),
          );
  }

  Widget _buildError(context) {
    return SliverFillRemaining(
      child: Center(
        child: CustomText.errorText(
            S.of(context).home_screen_search_activities_error),
      ),
    );
  }

  Widget _buildInProgress() {
    return SliverFillRemaining(
      child: Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildNoResults(BuildContext context) {
    return SliverFillRemaining(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.screenPadding),
          child: Align(
            child: CustomText.screenInfoHeader(
                S.of(context).home_screen_search_activities_no_results),
          ),
        ),
      ),
    );
  }

  Widget _buildActivityTile(BuildContext context, Activity activity) {
    return ActivityCard.searchCard(
      context,
      activity: activity,
    );
  }
}
