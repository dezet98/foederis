import 'package:engineering_thesis/components/custom_widgets/icon/custom_icon.dart';
import 'package:flutter/material.dart';

import '../../../blocs/abstract_blocs/choice_filters/filter/filter_bloc.dart';
import '../../../blocs/abstract_blocs/choice_filters/filters/filters_bloc.dart';
import '../../../blocs/abstract_blocs/choice_filters/multi_choice_filter_bloc.dart';
import '../../../blocs/abstract_blocs/choice_filters/single_choice_filter_bloc.dart';
import '../../../blocs/abstract_blocs/choice_filters/sort_choice_filter_bloc.dart';
import '../../../generated/l10n.dart';
import '../../../shared/routing.dart';
import '../../../shared/theme.dart';
import '../../custom_widgets/app_bars/custom_app_bar.dart';
import '../../custom_widgets/buttons/custom_button.dart';
import '../../custom_widgets/text/cutom_text.dart';
import '../../templates/template_screen.dart';
import 'filter_choice.dart';

class FiltersScreen extends StatelessWidget {
  final FiltersBloc filtersBloc;

  FiltersScreen({@required this.filtersBloc});

  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
      usePadding: false,
      platformAppBar: CustomAppBar(
        customIcon: CustomIcon.closeScreen(context),
        title: S.of(context).filter_screen_nav_title,
      ),
      body: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(Dimensions.screenPadding),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(_buildFilters(context)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildFilters(context) {
    return [
      for (FilterBloc bloc in filtersBloc.filtersBlocs)
        _buildFilterWrapping(
            filter: _getFilterWidget(bloc), title: bloc.getTitle(context)),
      CustomButton.applyForm(
        onPressed: () {
          filtersBloc.add(FiltersChangedEvent());
          Routing.pop(context);
        },
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
                child: CustomText(title, textType: TextType.menu_title),
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
      return FilterChoice(bloc);
    } else if (bloc is SingleChoiceFilterBloc) {
      return FilterChoice(bloc);
    } else if (bloc is SortChoiceFilterBloc) {
      return FilterChoice(bloc);
    }
    assert(false);
    return Container();
  }
}
