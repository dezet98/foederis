import 'package:engineering_thesis/blocs/abstract_blocs/filter/filter_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/multi_choice_filter/multi_choice_filter_bloc.dart';
import 'package:flutter/material.dart';

class MultiChoiceFilter extends StatefulWidget {
  final MultiChoiceFilterBloc bloc;

  MultiChoiceFilter(this.bloc);

  @override
  _MultiChoiceFilterState createState() => _MultiChoiceFilterState();
}

class _MultiChoiceFilterState extends State<MultiChoiceFilter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: _buildChips(),
      ),
    );
  }

  List<Widget> _buildChips() {
    return [
      for (int i = 0; i < widget.bloc.optionsLenght; i++)
        ChoiceChip(
          label: Text(widget.bloc.display(widget.bloc.options()[i])),
          selected: widget.bloc.isSelected(i),
          onSelected: (bool value) {
            setState(() {
              widget.bloc.add(FilterChangeEvent(selectedIndex: i));
            });
          },
        )
    ];
  }
}
