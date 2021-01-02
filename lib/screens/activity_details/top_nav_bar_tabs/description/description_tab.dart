import 'package:engineering_thesis/blocs/specific_blocs/common/category_fetching_bloc.dart';
import 'package:engineering_thesis/components/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/components/bloc_builders/fetching_bloc_builder.dart';
import 'package:engineering_thesis/components/custom_widgets/text/cutom_text.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:engineering_thesis/models/category.dart';
import 'package:engineering_thesis/repositories/category_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DescriptionTab extends NavBarTab {
  final Activity activity;

  DescriptionTab({@required this.activity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSingleAttribute(
            context, 'FreeJoin', activity.freeJoin.toString()),
        _buildSingleAttribute(context, 'Address', activity.address.toString()),
        _buildSingleAttribute(
            context, 'maxEntry', activity.maxEntry.toString()),
        _buildSingleAttribute(
            context, 'minEntry', activity.minEntry.toString()),
        _buildSingleAttribute(context, 'description', activity.description),
        _buildSingleAttribute(
            context, 'startDate', activity.startDate.toString()),
        _buildCategoryAttribute(context, 'category'),
      ],
    );
  }

  Widget _buildSingleAttribute(context, String subtitle, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CustomText.menuTitle(subtitle, textAlign: TextAlign.left),
          CustomText.listItem(text),
        ],
      ),
    );
  }

  Widget _buildCategoryAttribute(BuildContext context, String subtitle) {
    return FetchingBlocBuilder(
      fetchingCubit: CategoryFetchingBloc(
        categoryRepository: RepositoryProvider.of<CategoryRepository>(context),
        categoryRef: activity.categoryRef,
      ),
      buildSuccess: (data) {
        return _buildSingleAttribute(
            context,
            subtitle,
            (data as Category).titleAsString(
              context,
            ));
      },
    );
  }

  @override
  Widget getIcon(BuildContext context) => null;

  @override
  String getLabel(BuildContext context) => 'Details';
}
