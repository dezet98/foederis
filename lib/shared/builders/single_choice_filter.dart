import 'package:engineering_thesis/blocs/abstract_blocs/filter/filter_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/single_choice_filter/single_choice_filter_bloc.dart';
import 'package:flutter/material.dart';

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
          label: Text(widget.bloc.display(widget.bloc.options[i]).toString()),
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
