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
        _buildSingleAttribute('FreeJoin', activity.freeJoin.toString()),
        _buildSingleAttribute('Address', activity.address.toString()),
        _buildSingleAttribute('maxEntry', activity.maxEntry.toString()),
        _buildSingleAttribute('minEntry', activity.minEntry.toString()),
        _buildSingleAttribute('regular', activity.regular.toString()),
        _buildSingleAttribute('startDate', activity.startDate.toString()),
        _buildCategoryAttribute(context, 'category'),
      ],
    );
  }

  Widget _buildSingleAttribute(String subtitle, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CustomText(subtitle,
              textType: TextType.menu_title, alignment: Alignment.centerLeft),
          CustomText(text, textType: TextType.list_item),
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
        return _buildSingleAttribute(subtitle, (data as Category).title);
      },
    );
  }

  @override
  Icon getIcon(BuildContext context) => null;

  @override
  String getLabel(BuildContext context) => 'Details';
}
