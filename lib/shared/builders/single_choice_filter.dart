import 'package:engineering_thesis/blocs/abstract_blocs/choice_filters/filter/filter_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/choice_filters/single_choice_filter_bloc.dart';
import 'package:engineering_thesis/shared/components/chips/custom_chip.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class SingleChoiceFilter extends StatefulWidget {
  final SingleChoiceFilterBloc bloc;

  SingleChoiceFilter(this.bloc);

  @override
  _SingleChoiceFilterState createState() => _SingleChoiceFilterState();
}

class _SingleChoiceFilterState extends State<SingleChoiceFilter> {
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
      for (int i = 0; i < widget.bloc.optionsLenght; i++)
        CustomChip(
          text: widget.bloc.options[i].label,
          selected: widget.bloc.isSelected(i),
          onSelected: (bool value) {
            setState(() {
              widget.bloc.add(FilterChangeEvent(selectedIndex: i));
            });
          },
        ),
    ];
  }
}
