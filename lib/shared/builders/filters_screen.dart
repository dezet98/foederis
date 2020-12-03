import 'package:engineering_thesis/blocs/abstract_blocs/choice_filters/filter/filter_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/choice_filters/filters/filters_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/choice_filters/multi_choice_filter_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/choice_filters/single_choice_filter_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/choice_filters/sort_choice_filter_bloc.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/shared/builders/multi_choice_filter.dart';
import 'package:engineering_thesis/shared/builders/single_choice_filter.dart';
import 'package:engineering_thesis/shared/builders/sort_choice_filter.dart';
import 'package:engineering_thesis/shared/components/buttons/custom_button.dart';
import 'package:engineering_thesis/shared/components/text/cutom_text.dart';
import 'package:engineering_thesis/shared/templates/template_screen.dart';
import 'package:engineering_thesis/shared/theme.dart';
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
      usePadding: false,
      platformAppBar: PlatformAppBar(
        title: CustomText(S.of(context).filter_screen_nav_title,
            textType: TextType.screen_bar_title),
      ),
      body: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(Dimensions.screenPadding),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(_buildFilters()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildFilters() {
    return [
      for (FilterBloc bloc in widget.filtersBloc.filtersBlocs)
        _buildFilterWrapping(
            filter: _getFilterWidget(bloc), title: bloc.filterTitle),
      CustomButton(
        buttonType: ButtonType.raised_next_button,
        onPressed: filtersApply,
        text: S.of(context).filter_screen_apply_button_text,
      )
    ];
  }

  Widget _buildFilterWrapping({
    @required Widget filter,
    String title,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Dimensions.gutterMedium),
      child: Column(
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.only(bottom: Dimensions.gutterSmall),
              child: Align(
                child: CustomText(title, textType: TextType.subtitle1),
                alignment: Alignment.centerLeft,
              ),
            ),
          filter,
        ],
      ),
    );
  }

  Widget _getFilterWidget(FilterBloc bloc) {
    if (bloc is MultiChoiceFilterBloc) {
      return MultiChoiceFilter(bloc);
    } else if (bloc is SingleChoiceFilterBloc) {
      return SingleChoiceFilter(bloc);
    } else if (bloc is SortChoiceFilterBloc) {
      return SortChoiceFilter(bloc);
    }
    assert(false);
    return Container();
  }

  void filtersApply() {
    widget.filtersBloc.add(FiltersChangedEvent());
    Routing.pop(context);
  }
}
