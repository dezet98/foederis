import 'package:engineering_thesis/components/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/components/custom_widgets/text/cutom_text.dart';
import 'package:engineering_thesis/models/activity.dart';
import 'package:flutter/material.dart';

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
        _buildSingleAttribute('category', activity.category?.title),
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

  @override
  Icon getIcon(BuildContext context) => null;

  @override
  String getLabel(BuildContext context) => 'Details';
}
