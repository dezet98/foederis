import 'package:engineering_thesis/blocs/abstract_blocs/choice_filters/filter/filter_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/choice_filters/filter_option/filter_option_bloc.dart';
import 'package:engineering_thesis/shared/view/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../custom_widgets/chips/custom_chip.dart';

class FilterChoice extends StatelessWidget {
  final FilterBloc bloc;

  FilterChoice(this.bloc);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.gutterHuge,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: _buildChips(),
      ),
    );
  }

  List<Widget> _buildChips() {
    return [
      for (FilterOptionBloc optionBloc in bloc.options)
        BlocBuilder(
          cubit: optionBloc,
          builder: (context, state) => CustomChip(
            text: optionBloc.getLabel(context),
            selected: optionBloc.isSelected,
            onSelected: (bool value) {
              bloc.add(FilterChangeEvent(filterOptionBloc: optionBloc));
            },
          ),
        )
    ];
  }
}
