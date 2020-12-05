import 'package:engineering_thesis/blocs/abstract_blocs/fetch/fetch_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/search_filter/search_filter_bloc.dart';
import 'package:engineering_thesis/blocs/search_activities/search_activities_filters_bloc.dart';
import 'package:engineering_thesis/blocs/search_activities/search_activities_search_filter_bloc.dart';
import 'package:engineering_thesis/blocs/search_activities/search_activities_fetching_bloc.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/shared/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/shared/builders/fetching_builder.dart';
import 'package:engineering_thesis/shared/builders/filtered_data.dart';
import 'package:engineering_thesis/shared/components/buttons/custom_button.dart';
import 'package:engineering_thesis/shared/components/card/custom_card.dart';
import 'package:engineering_thesis/shared/routing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import '../../../../shared/builders/custom_search.dart';

class SearchActivitiesScreen extends NavBarTab {
  @override
  Widget build(BuildContext context) {
    return BlocListener(
      cubit: BlocProvider.of<SearchActivitiesSearchFilterBloc>(context),
      listener: (context, state) {
        if (state is SearchFilterSelectedOptionState) {
          BlocProvider.of<SearchActivitiesFetchingBloc>(context)
              .add(FetchRefreshEvent(filters: [state.fetchFilter]));
        }
      },
      child: CustomScrollView(
        slivers: [
          _buildAppBar(context,
              BlocProvider.of<SearchActivitiesSearchFilterBloc>(context)),
          _buildSearchedActivities(context),
        ],
      ),
    );
  }

  Widget _buildSearchedActivities(context) {
    return FetchingBuilder(
      fetchingCubit: BlocProvider.of<SearchActivitiesFetchingBloc>(context),
      buildSuccess: (activities) {
        return FilteredData<Activity>(
          data: activities,
          filtersBloc: BlocProvider.of<SearchActivitiesFiltersBloc>(context),
          child: _buildActivitiesList,
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

  Widget _buildAppBar(
      BuildContext context, SearchActivitiesSearchFilterBloc searchFilterBloc) {
    return SliverAppBar(
      title: BlocBuilder(
        cubit: searchFilterBloc,
        builder: (context, state) {
          return Text(
            searchFilterBloc.selectedOption != null
                ? searchFilterBloc.display(searchFilterBloc.selectedOption)
                : 'Choose City',
          );
        },
      ),
      elevation: 4,
      actions: [
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              await showSearch<dynamic>(
                context: context,
                delegate: CustomSearch(
                  searchFilterBloc: searchFilterBloc,
                ),
              );
            }),
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

  Widget _buildActivitiesList(List<Activity> activities) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [for (Activity activity in activities) _buildActivityTile(activity)],
      ),
    );
  }

  Widget _buildActivityTile(Activity activity) {
    return CustomCard(
      title: activity.title,
      subtitle: activity.categoryRef.toString(),
    );
  }

  @override
  Icon getIcon(BuildContext context) => Icon(PlatformIcons(context).search);

  @override
  String get label => 'Search';
}
