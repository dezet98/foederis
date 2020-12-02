import 'package:engineering_thesis/blocs/abstract_blocs/filter/filter_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/filters/filters_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/choice_filters/multi_choice_filter_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/choice_filters/single_choice_filter_bloc.dart';
import 'package:engineering_thesis/shared/builders/multi_choice_filter.dart';
import 'package:engineering_thesis/shared/builders/single_choice_filter.dart';
import 'package:engineering_thesis/shared/templates/template_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../routing.dart';

class FiltersScreen extends StatefulWidget {
  final FiltersBloc filtersBloc;

  FiltersScreen({@required this.filtersBloc});
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      platformAppBar: PlatformAppBar(
        title: Text("Filter"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                for (FilterBloc bloc in widget.filtersBloc.filtersBlocs)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Column(children: [
                      _buildSingleFilterTitle(title: bloc.filterTitle),
                      _buildFilterFromBloc(bloc),
                    ]),
                  ),
                FlatButton(
                  onPressed: filtersApply,
                  child: Text('Apply'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSingleFilterTitle({String title}) {
    return Column(children: [
      Divider(
        color: Colors.grey,
        height: 16,
        thickness: 2,
      ),
      if (title != null)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
              ),
            ),
          ],
        ),
    ]);
  }

  Widget _buildFilterFromBloc(FilterBloc bloc) {
    if (bloc is MultiChoiceFilterBloc) {
      return MultiChoiceFilter(bloc);
    } else if (bloc is SingleChoiceFilterBloc) {
      return SingleChoiceFilter(bloc);
    }
    assert(false);
    return Container();
  }

  void filtersApply() {
    widget.filtersBloc.add(FiltersChangedEvent());
    Routing.pop(context);
  }
}
