import 'package:engineering_thesis/blocs/specific_blocs/common/category_fetching_bloc.dart';
import 'package:engineering_thesis/data/models/activity.dart';
import 'package:engineering_thesis/data/models/attendee.dart';
import 'package:engineering_thesis/data/models/category.dart';
import 'package:engineering_thesis/data/repositories/category_repository.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/shared/utils/dates.dart';
import 'package:engineering_thesis/shared/view/theme.dart';
import 'package:engineering_thesis/ui/components/abstract/nav_bar_tab.dart';
import 'package:engineering_thesis/ui/components/bloc_builders/fetching_bloc_builder.dart';
import 'package:engineering_thesis/ui/components/custom_widgets/text/cutom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DescriptionTab extends NavBarTab {
  final Activity activity;
  final List<Attendee> attendees;
  final Widget cancelActivityButton;
  final Widget cancelInvolvementButton;

  DescriptionTab({
    @required this.activity,
    @required this.attendees,
    this.cancelActivityButton,
    this.cancelInvolvementButton,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _getActivityStatus,
        _getRecordsAttribute,
        _getAttendesAttribute,
        _getAddressAttribute,
        _attendeesRange,
        _getDescriptionAttribute,
        _getStartDateAttribute,
        _buildCategoryAttribute,
        SizedBox(height: Dimensions.gutterMedium),
        if (cancelActivityButton != null) cancelActivityButton,
        if (cancelInvolvementButton != null) cancelInvolvementButton,
      ],
    );
  }

  Widget _buildSingleAttribute(context, String subtitle, String text) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.screenPadding),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: CustomText.menuTitle(subtitle, textAlign: TextAlign.left),
          ),
          CustomText.listItem(text),
        ],
      ),
    );
  }

  Widget get _getActivityStatus {
    return Builder(
      builder: (context) => _buildSingleAttribute(
        context,
        S.of(context).activity_details_screen_details_tab_status,
        activity.status(context, attendees),
      ),
    );
  }

  Widget get _getRecordsAttribute {
    return Builder(
      builder: (context) => _buildSingleAttribute(
        context,
        S.of(context).activity_details_screen_details_tab_records_label,
        activity.freeJoin
            ? S
                .of(context)
                .activity_details_screen_details_tab_records_free_join
            : S
                .of(context)
                .activity_details_screen_details_tab_records_with_appeal,
      ),
    );
  }

  Widget get _getAttendesAttribute {
    return Builder(
      builder: (context) => _buildSingleAttribute(
        context,
        S.of(context).activity_details_screen_details_tab_attendees_label,
        attendees.length.toString(),
      ),
    );
  }

  Widget get _getAddressAttribute {
    return Builder(
      builder: (context) => _buildSingleAttribute(
        context,
        S.of(context).activity_details_screen_details_tab_address,
        activity.address.toString(),
      ),
    );
  }

  Widget get _attendeesRange {
    return Builder(
      builder: (context) => _buildSingleAttribute(
        context,
        S.of(context).activity_details_screen_details_tab_attendees_range_label,
        S.of(context).activity_details_screen_details_tab_attendees_range(
            activity.minEntry.toString(), activity.maxEntry.toString()),
      ),
    );
  }

  Widget get _getDescriptionAttribute {
    return Builder(
      builder: (context) => _buildSingleAttribute(
        context,
        S.of(context).activity_details_screen_details_tab_description,
        activity.description,
      ),
    );
  }

  Widget get _getStartDateAttribute {
    return Builder(
      builder: (context) => _buildSingleAttribute(
        context,
        S.of(context).activity_details_screen_details_tab_start_date,
        formatDate('dd-MM-yyyy hh:mm', activity.startDate),
      ),
    );
  }

  Widget get _buildCategoryAttribute {
    return Builder(
      builder: (context) {
        return FetchingBlocBuilder(
          fetchingCubit: CategoryFetchingBloc(
            categoryRepository:
                RepositoryProvider.of<CategoryRepository>(context),
            categoryRef: activity.categoryRef,
          ),
          buildSuccess: (data) {
            return _buildSingleAttribute(
                context,
                S.of(context).activity_details_screen_details_tab_category,
                (data as Category).titleAsString(
                  context,
                ));
          },
        );
      },
    );
  }

  @override
  Widget getIcon(BuildContext context) => null;

  @override
  String getLabel(BuildContext context) =>
      S.of(context).activity_details_screen_details_tab_nav_bar_title;
}
